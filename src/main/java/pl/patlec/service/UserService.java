package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.dom4j.DocumentException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.patlec.dto.UserDto;
import pl.patlec.model.User;
import pl.patlec.repo.RoleRepository;
import pl.patlec.repo.UserRepository;
import pl.patlec.utils.Mailer;

import javax.mail.MessagingException;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    private final RoleRepository roleRepository;

    private final Mailer mailer;

    private final BCryptPasswordEncoder passwordEncoder;

    public void addUser(User user){
        userRepository.save(user);
    }

    public User findUserById(Long id){
        Optional<User> optionalUser = userRepository.findById(id);

        return optionalUser.orElse(null);
    }

    public User findUserByEmail(String email){
        return userRepository.findByEmail(email);
    }

    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    @Transactional
    public void registerUser(UserDto userDto) throws MessagingException, IOException, DocumentException {

        final User user = new User();

        user.setEmail(userDto.getEmail());
        user.setName(userDto.getName());
        user.setSurname(userDto.getSurname());
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        user.setEnabled(false);
        user.getRoleSet().add(roleRepository.findByName("ROLE_USER"));
        user.setRegistrationToken(generateToken());
        userRepository.save(user);
        sendRegistrationEmail(user.getEmail());
    }

    public String generateToken(){
        Random generator = new Random();

        StringBuilder token = new StringBuilder();

        for (int i = 0; i < 20; i++){
            if (generator.nextInt(2) == 1)
                token.append((char)(generator.nextInt(26) + 97));

            else token.append(generator.nextInt(10));
        }

        return token.toString();
    }

    public String addPassRecoveryToken(String email) {

        User user = userRepository.findByEmail(email);

        return "http://www.ameliaweb.pl/gifts/token/" + user.getRegistrationToken() + "/" + user.getId();
    }

    public void sendRegistrationEmail(String receiverEmail) throws MessagingException, IOException, DocumentException {

        User user = userRepository.findByEmail(receiverEmail);

        //String link = "http://77.55.213.198:8080/AlbumManager-1.0-SNAPSHOT/register/" + user.getId() + "/" + user.getRegistrationToken();

        String link = "http://localhost:8080/register/" + user.getId() + "/" + user.getRegistrationToken();


        String message= "<html lang=\"en\">" +
                "<head>" +
                "<title>Odzyskiwanie hasla</title>" +
                "</head>" +
                "<body>" +
                "<div style=\"background-color: #f9c910; text-align: center\"><h1>Album Manager</h1></div>" +
                "<p style=\"text-align: center\">Thank you for registering on our site. Please click link below to confirm registration process:</p>" +
                "<p style=\"text-align: center\"><a style=\"color: #2c7021; text-decoration: none; font-size: 30px\" href=\"" + link + "\" target=\"_blank\">Confirm registration</a></p>" +
                "<p style=\"margin-top: 50px; text-align: center\">If you didn't register on our site, ignore this e-mail and make sure your data is safe.</p>" +
                "</body></html>";

        mailer.send(receiverEmail, "Registration on Album Manager", message);
    }


    /*

    <html lang="en">
<head>
    <title>Title</title>
</head>
<body>
<div style="background-color: #f9c910; text-align: center"><h1>Album Manager</h1></div>
<p style="text-align: center">You have received this e-mail because your e-mail address was given during password retrieval process. To retrieve your password click here:</p>
<p style="text-align: center"><a style="color: #2c7021; text-decoration: none; font-size: 30px" href="http://77.55.213.198:8080/AlbumManager-1.0-SNAPSHOT/" target="_blank">Retrieve password</a></p>
<p style="margin-top: 50px; text-align: center">If you didn't lost your password, ignore this e-mail and make sure your data is safe.</p>
</body>
</html>

     */

    /*public void sendPassRecoveryEmail(String receiverEmail) {

        String link = addPassRecoveryToken(receiverEmail);

        String message= "<!DOCTYPE html>" +
                "<html lang=\"pl\">" +
                "<head>" +
                "<meta charset=\"UTF-8\">" +
                "<title>Odzyskiwanie hasla</title>" +
                "<meta http-equiv=\"X-Ua-Compatible\" content=\"IE=edge,chrome=1\">" +
                "</head>" +
                "<body>" +
                "<div style=\"background-color: #f9c910; text-align: center\"><h1>Oddaj rzeczy</h1></div>" +
                "<p style=\"text-align: center\">W celu odzyskania hasla do aplikacji \"Oddaj rzeczy\" kliknij w link:</p>" +
                "<p style=\"text-align: center;\"><a style=\"color: #2c7021; text-decoration: none; font-size: 30px\" href=\"" + link + "\" target=\"_blank\">Odzyskaj haslo</a></p>" +
                "<p style=\"margin-top: 50px; text-align: center\">Jezeli ten mail to pomylka, skasuj wiadomosc.</p>" +
                "<p style=\"margin-top: 50px; text-align: center\">Pozdrawiamy</p>" +
                "<p style=\"text-align: center\"><a href=\"http://www.ameliaweb.pl/gifts\">Link do aplikacji.</a></p>" +
                "</body>" +
                "</html>";
        String subject = "Aplikacja \"Oddaj rzeczy\". Resetowanie hasla";
        mailer.send("stan.zapalny.band@gmail.com","halina07033",receiverEmail,subject,message);
    }*/
}

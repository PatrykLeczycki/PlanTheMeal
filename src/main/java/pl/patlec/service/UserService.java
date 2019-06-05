package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.dom4j.DocumentException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.patlec.dto.UserDto;
import pl.patlec.model.Prompt;
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

    private final Prompt prompt;

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

    public boolean isAdmin(User user){
        return user.getRoleSet().contains(roleRepository.findByName("ROLE_ADMIN"));
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
        prompt.add("recoverymailsent");
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

    @Transactional
    public void addPassRecoveryToken(String email) {

        User user = userRepository.findByEmail(email);
        user.setPassRecoveryToken(generateToken());
        userRepository.save(user);
    }

    public void sendRegistrationEmail(String receiverEmail) throws MessagingException, IOException, DocumentException {

        User user = userRepository.findByEmail(receiverEmail);

        String link = "pleczycki.pl/planthemeal/register/" + user.getId() + "/" + user.getRegistrationToken();

        //String link = "http://localhost:8080/register/" + user.getId() + "/" + user.getRegistrationToken();


        String message= "<html lang=\"en\">" +
                "<head>" +
                "<title>Confirm registration</title>" +
                "</head>" +
                "<body>" +
                "<div style=\"background-color: #f9c910; text-align: center\"><h1><a href=\"pleczycki.pl/planthemeal/\">PlanTheMeal</a></h1></div>" +
                "<p style=\"text-align: center\">Thank you for registering on our site. Please click link below to confirm registration process:</p>" +
                "<p style=\"text-align: center\"><a style=\"color: #2c7021; text-decoration: none; font-size: 30px\" href=\"" + link + "\" target=\"_blank\">Confirm registration</a></p>" +
                "<p style=\"margin-top: 50px; text-align: center\">If you didn't register on our site, ignore this e-mail and make sure your data is safe.</p>" +
                "</body></html>";

        mailer.send(receiverEmail, "Registration on PlanTheMeal", message);
    }

    public void sendPassRecoveryEmail(String receiverEmail) {

        User user = userRepository.findByEmail(receiverEmail);

        String link = "pleczycki.pl/planthemeal/lostpassword/" + user.getId() + "/" + user.getPassRecoveryToken();

        //String link = "http://localhost:8080/lostpassword/" + user.getId() + "/" + user.getPassRecoveryToken();



        String message= "<html lang=\"en\">" +
                "<head>" +
                "<title>Password recovery</title>" +
                "</head>" +
                "<body>" +
                "<div style=\"background-color: #f9c910; text-align: center\"><h1><a href=\"pleczycki.pl/planthemeal/\">PlanTheMeal</a></h1></div>" +
                "<p style=\"text-align: center\">You have received this e-mail because your e-mail address was given during password retrieval process. To retrieve your password click here:</p>" +
                "<p style=\"text-align: center\"><a style=\"color: #2c7021; text-decoration: none; font-size: 30px\" href=\"" + link + "\" target=\"_blank\">Retrieve password</a></p>" +
                "<p style=\"margin-top: 50px; text-align: center\">If you didn't lost your password, ignore this e-mail and make sure your data is safe.</p>" + "</body></html>";

        mailer.send(receiverEmail, "PlanTheMeal - password recovery", message);
    }
}

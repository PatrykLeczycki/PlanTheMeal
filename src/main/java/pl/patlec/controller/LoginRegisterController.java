package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.dom4j.DocumentException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.patlec.dto.UserDto;
import pl.patlec.model.Prompt;
import pl.patlec.model.User;
import pl.patlec.service.UserService;

import javax.mail.MessagingException;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
public class LoginRegisterController {

    private final UserService userService;
    private final Prompt prompt;
    private final BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String register(Model model){
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("userDto") @Valid UserDto userDto, BindingResult result, Model model) throws DocumentException, MessagingException, IOException {
        if (!result.hasErrors() && !userDto.getEmail().equals(userDto.getPassword()) &&
                userService.findUserByEmail(userDto.getEmail()) == null &&
                userDto.getPassword().equals(userDto.getConfirmPassword()) &&
                userDto.getPassword().length() >= 8) {

            userService.registerUser(userDto);
            return "redirect:/login?registered=true";
        }

        model.addAttribute("emailexists", userService.findUserByEmail(userDto.getEmail()) != null);
        model.addAttribute("passwordseq", !userDto.getPassword().equals(userDto.getConfirmPassword()));
        model.addAttribute("emaileqpass", userDto.getEmail().equals(userDto.getPassword()));
        return "register";
    }

    @RequestMapping(value = "/register/{id}/{token}", method = RequestMethod.GET)
    public String register(@PathVariable long id, @PathVariable String token){
        User user = userService.findUserById(id);

        if (!Objects.isNull(user)){
            String userToken = user.getRegistrationToken();
            if (userToken.equals(token)){
                user.setRegistrationToken(null);
                user.setEnabled(true);
                userService.addUser(user);
            }
        }

        return "redirect:/login?activated=true";
    }

    @GetMapping("/login")
    public String loginPanel(Model model){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth instanceof AnonymousAuthenticationToken){

           if(prompt.contains("recoverymailsent")){
                model.addAttribute("recoverymailsent", true);
                prompt.getNames().remove("recoverymailsent");
           }
           return "login";
        }


        return "redirect:/user/dashboard";
    }

    @GetMapping("/lostpassword")
    public String lostPassword(){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth instanceof AnonymousAuthenticationToken)
            return "lostpassword1";

        return "redirect:/user/dashboard";
    }

    @PostMapping("/lostpassword")
    public String lostPassword(@RequestParam("email-login") String emailLogin, Model model){

        User user = userService.findUserByEmail(emailLogin);

        if (Objects.isNull(user)){
            model.addAttribute("wrongemailorlogin", true);
            return "lostpassword1";
        }

        userService.addPassRecoveryToken(user.getEmail());
        userService.sendPassRecoveryEmail(user.getEmail());

        return "redirect:/login";
    }

    @RequestMapping(value = "/lostpassword/{id}/{token}", method = RequestMethod.GET)
    @Transactional
    public String lostPassword(@PathVariable long id, @PathVariable String token, Model model){

        User user = userService.findUserById(id);

        if (!Objects.isNull(user)){
            String userToken = user.getPassRecoveryToken();
            if (userToken.equals(token)){
                user.setPassRecoveryToken(null);
                userService.addUser(user);
                model.addAttribute("id", id);
                model.addAttribute("token", token);
                return "lostpassword2";
            }
        }

        prompt.add("linkcorrupted");

        return "redirect:/login";
    }

    @RequestMapping(value = "/lostpassword/{id}/{token}", method=RequestMethod.POST)
    public String lostPassword(@PathVariable long id, @PathVariable String token, @RequestParam("newPassword") String newPassword, @RequestParam("newPasswordRepeat") String newPasswordRepeat, Model model){

        if(newPassword.length() < 8 || !newPassword.equals(newPasswordRepeat)){
            if (newPassword.length() < 8)
                model.addAttribute("passlength", true);
            if (!newPassword.equals(newPasswordRepeat))
                model.addAttribute("passnoteq", true);

            model.addAttribute("id", id);
            model.addAttribute("token", token);

            return "lostpassword2";
        }

        User user = userService.findUserById(id);

        if (!Objects.isNull(user)){
            user.setPassword(passwordEncoder.encode(newPassword));
            userService.addUser(user);
            prompt.add("passwordchanged");
        }

        return "redirect:/login";
    }

}

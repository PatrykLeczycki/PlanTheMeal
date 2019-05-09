package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.dom4j.DocumentException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.patlec.dto.UserDto;
import pl.patlec.model.User;
import pl.patlec.service.UserService;

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class LoginRegisterController {

    private final UserService userService;

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
    public String loginPanel(){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth instanceof AnonymousAuthenticationToken)
            return "login";

        return "redirect:/user/dashboard";
    }
}

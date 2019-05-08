package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.patlec.model.User;
import pl.patlec.service.RecipeService;
import pl.patlec.service.UserService;

import java.security.Principal;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final RecipeService recipeService;

    private final BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/dashboard")
    public String dashboard(Model model, Principal principal){

        model.addAttribute("recipes", recipeService.countByUser(userService.findUserByEmail(principal.getName())));
        return "users/dashboard";
    }

    @GetMapping("/newpassword")
    public String newPassword(){
        return "users/newpassword";
    }

    @PostMapping("/newpassword")
    public String newPassword(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword, @RequestParam("newPasswordRepeat") String newPasswordRepeat, Model model, Principal principal){

        User loggedUser = userService.findUserByEmail(principal.getName());

        if (!passwordEncoder.matches(oldPassword, loggedUser.getPassword())){
            model.addAttribute("oldwrong", true);
            return "users/newpassword";
        }

        if (!newPassword.equals(newPasswordRepeat)){
            model.addAttribute("passnoteq", true);
            return "users/newpassword";
        }

        loggedUser.setPassword(passwordEncoder.encode(newPassword));
        userService.addUser(loggedUser);
        model.addAttribute("newPassInfo", "Password has been changed.");
        return "redirect:/user/dashboard";
    }


}

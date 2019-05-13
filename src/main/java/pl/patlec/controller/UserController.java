package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.patlec.model.User;
import pl.patlec.service.PlanService;
import pl.patlec.service.RecipeService;
import pl.patlec.service.UserService;
import java.security.Principal;
import java.util.Objects;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final RecipeService recipeService;
    private final PlanService planService;
    private final PlanController planController;

    private final BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/dashboard")
    public String dashboard(Model model, Principal principal){

        model.addAttribute("recipes", recipeService.countByUser(userService.findUserByEmail(principal.getName())));
        model.addAttribute("plans", planService.countByUser(userService.findUserByEmail(principal.getName())));
        model.addAttribute("dashboard", true);

        Long lastPlanId = planService.getUserLastPlanId(principal);

        if (Objects.isNull(lastPlanId))
            model.addAttribute("noplans", true);
        else {
            model.addAttribute("lastplanname", planService.getById(lastPlanId).getName());
            model.addAttribute("lastplan", planController.planDetails(lastPlanId));
        }

        return "users/dashboard";
    }

    @GetMapping("/editdata")
    public String editData(Model model, Principal principal){

        User user = userService.findUserByEmail(principal.getName());

        model.addAttribute("name", user.getName());
        model.addAttribute("surname", user.getSurname());
        return "users/editdata";
    }

    @PostMapping("/editdata")
    public String editData(@RequestParam("name") String name, @RequestParam("surname") String surname, Model model, Principal principal){

        User user = userService.findUserByEmail(principal.getName());

        if(name.length() < 1 || surname.length() < 1){
            if(name.length() < 1)
                model.addAttribute("emptyname", true);
            if(surname.length() < 1)
                model.addAttribute("emptysurname", true);

            model.addAttribute("name", user.getName());
            model.addAttribute("surname", user.getSurname());

           return "users/editdata";
        }

        user.setName(name);
        user.setSurname(surname);
        userService.addUser(user);

        return "redirect:/user/dashboard";
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

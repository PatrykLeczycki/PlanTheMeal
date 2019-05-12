package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.patlec.model.User;
import pl.patlec.repo.RoleRepository;
import pl.patlec.service.MealService;
import pl.patlec.service.PlanService;
import pl.patlec.service.RecipeService;
import pl.patlec.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Objects;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final UserService userService;
    private final RoleRepository roleRepository;
    private final PlanService planService;
    private final RecipeService recipeService;
    private final MealService mealService;

    @GetMapping("/users")
    public String all(Model model, Principal principal){

        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("loggedUser", principal.getName());

        return "admins/users";
    }

    @RequestMapping(value = "/changerole/{id}", method = RequestMethod.GET)
    public String changeUserRole(@PathVariable long id, HttpServletRequest request, Principal principal){

        User user = userService.findUserById(id);

        if (!Objects.isNull(user)){
            if(!user.getEmail().equals(principal.getName())){
                if(user.getRoleSet().contains(roleRepository.findByName("ROLE_ADMIN")))
                    user.getRoleSet().remove(roleRepository.findByName("ROLE_ADMIN"));
                else user.getRoleSet().add(roleRepository.findByName("ROLE_ADMIN"));
                userService.addUser(user);
            } else request.setAttribute("ownRole", "You can't change your own role.");
        }

        // TODO: dać obsługę nieistniejącego usera

        return "redirect:/admin/users";
    }


    @RequestMapping(value = "/plan/delete/{id}", method = RequestMethod.GET)
    public String deletePlan(@PathVariable("id") Long id){

        planService.delete(planService.getById(id));
        return "redirect:/user/plan/all";
    }

    @RequestMapping(value = "/recipe/delete/{id}", method = RequestMethod.GET)
    public String deleteRecipe(@PathVariable("id") Long id){

        recipeService.delete(recipeService.getById(id));
        return "redirect:/user/recipe/all";
    }

    @RequestMapping(value = "/plan/{planid}/deletemeal/{mealid}", method = RequestMethod.GET)
    public String deleteMeal(@PathVariable("planid") Long planId, @PathVariable("mealid") Long mealId){

        mealService.deleteMeal(mealId);
        return "redirect:/user/plan/details/" + planId;
    }

}

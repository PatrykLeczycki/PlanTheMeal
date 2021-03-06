package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.patlec.dto.RecipeDto;
import pl.patlec.model.Prompt;
import pl.patlec.model.Recipe;
import pl.patlec.model.User;
import pl.patlec.service.RecipeService;
import pl.patlec.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/recipe")
@RequiredArgsConstructor
public class RecipeController {

    private final RecipeService recipeService;
    private final UserService userService;
    private final Prompt prompt;

    @GetMapping("/all")
    public String allRecipes(Model model, Principal principal){

        model.addAttribute("recipes", recipeService.all());
        model.addAttribute("loggedUser", principal.getName());

        if(prompt.contains("recipeinmeal")){
            model.addAttribute("recipeinmeal", true);
            prompt.getNames().remove("recipeinmeal");
        }

        if(prompt.contains("accessdenied")){
            prompt.getNames().remove("accessdenied");
            model.addAttribute("accessdenied", true);
        }
        return "recipes/all";
    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String recipeDetails(@PathVariable long id, Model model){

        model.addAttribute("recipe", recipeService.getById(id));
        model.addAttribute("ingredients", stringToList(recipeService.getById(id).getIngredients()));
        model.addAttribute("steps", stringToList(recipeService.getById(id).getPreparation()));

        return "recipes/details";
    }

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("recipeDto", new RecipeDto());
        return "recipes/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("recipeDto") @Valid RecipeDto recipeDto, BindingResult result, HttpServletRequest request, Model model, Principal principal){

        String[] data = getDataFromRequest(request);
        recipeDto.setPreparation(data[0]);
        recipeDto.setIngredients(data[1]);

        if(result.hasErrors() || "".equals(recipeDto.getPreparation()) || "".equals(recipeDto.getIngredients())){

            if("".equals(recipeDto.getPreparation()))
                model.addAttribute("nopreparation", true);

            if("".equals(recipeDto.getIngredients()))
                model.addAttribute("noingredients", true);

            model.addAttribute("steps", stringToList(recipeDto.getPreparation()));
            model.addAttribute("ingredients", stringToList(recipeDto.getIngredients()));

            return "recipes/add";
        }

        recipeService.add(recipeDto, principal);
        return "redirect:/user/recipe/all";
    }

    @GetMapping("/edit/{id}")
    private String edit(@PathVariable long id, Model model, Principal principal){

        User loggedUser = userService.findUserByEmail(principal.getName());
        Recipe recipe = recipeService.getById(id);

        boolean accessDenied = !loggedUser.equals(recipe.getAuthor()) && !userService.isAdmin(loggedUser);

        if(accessDenied){
            prompt.getNames().add("accessdenied");
            return "redirect:/user/recipe/all";
        }

        model.addAttribute("recipe", recipe);
        model.addAttribute("ingredients", stringToList(recipe.getIngredients()));
        model.addAttribute("steps", stringToList(recipe.getPreparation()));

        return "recipes/edit";
    }

    @PostMapping("/edit")
    private String edit(@ModelAttribute("recipe") @Valid Recipe recipe, BindingResult result, HttpServletRequest request, Model model){

        String[] data = getDataFromRequest(request);
        recipe.setPreparation(data[0]);
        recipe.setIngredients(data[1]);

        boolean wrongData = result.hasErrors() || "".equals(recipe.getPreparation()) || "".equals(recipe.getIngredients());

        if(wrongData){
            if("".equals(recipe.getPreparation()))
                model.addAttribute("nopreparation", true);

            if("".equals(recipe.getIngredients()))
                model.addAttribute("noingredients", true);

            model.addAttribute("steps", stringToList(recipe.getPreparation()));
            model.addAttribute("ingredients", stringToList(recipe.getIngredients()));
            return "recipes/edit";
        }

        recipeService.edit(recipe);
        return "redirect:/user/recipe/all";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteRecipe(@PathVariable("id") Long id, Principal principal){

        recipeService.delete(recipeService.getById(id), principal);
        return "redirect:/user/recipe/all";
    }

    public List<String> stringToList(String string){

        String[] strings = string.split(", ");
        return new ArrayList<>(Arrays.asList(strings));
    }

    public static String[] getDataFromRequest(HttpServletRequest request){
        String[] steps = request.getParameterValues("step");
        String[] ings = request.getParameterValues("ingredient");

        String preparationSteps = "", ingredients = "";

        if (steps.length > 0){
            for (int i = 0; i < steps.length; i++){
                preparationSteps += steps[i];
                if (i != steps.length - 1)
                    preparationSteps += ", ";
            }
        }

        if(ings.length > 0){
            for (int i = 0; i < ings.length; i++){
                ingredients += ings[i];
                if (i != ings.length - 1)
                    ingredients += ", ";
            }
        }

        return new String[]{preparationSteps, ingredients};
    }

}

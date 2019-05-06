package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.patlec.model.Recipe;
import pl.patlec.service.RecipeService;
import pl.patlec.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/recipe")
@RequiredArgsConstructor
public class RecipeController {

    private final RecipeService recipeService;
    private final UserService userService;

    @GetMapping("/all")
    public String allRecipes(Model model){

        model.addAttribute("recipes", recipeService.all());
        return "recipes/all";
    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String recipeDetails(@PathVariable long id, Model model){

        model.addAttribute("recipe", recipeService.findById(id));
        model.addAttribute("ingredients", stringToList(recipeService.findById(id).getIngredients()));
        model.addAttribute("steps", stringToList(recipeService.findById(id).getPreparation()));

        return "recipes/details";
    }

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("recipe", new Recipe());
        return "recipes/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("recipe") Recipe recipe, HttpServletRequest request, Principal principal){
        recipe.setCreated(LocalDateTime.now());
        recipe.setAuthor(userService.findUserByEmail(principal.getName()));

        String[] ings = request.getParameterValues("ingredient");
        String[] steps = request.getParameterValues("step");

        String ingredients = "", preparationSteps = "";

        for (int i = 0; i < ings.length; i++){
            ingredients += ings[i];
            if (i != ings.length - 1)
                ingredients += ", ";
        }

        for (int i = 0; i < steps.length; i++){
            preparationSteps += steps[i];
            if (i != steps.length - 1)
                preparationSteps += ", ";
        }

        recipe.setIngredients(ingredients);
        recipe.setPreparation(preparationSteps);

        recipeService.add(recipe);
        return "redirect:/recipe/all";
    }

    @GetMapping("/edit/{id}")
    private String editRecipe(@PathVariable long id, Model model){

        model.addAttribute("recipe", recipeService.findById(id));
        model.addAttribute("ingredients", stringToList(recipeService.findById(id).getIngredients()));
        model.addAttribute("steps", stringToList(recipeService.findById(id).getPreparation()));


        return "recipes/edit";
    }

    @PostMapping("/edit")
    private String editRecipe(@ModelAttribute Recipe recipe, HttpServletRequest request){

        String[] ings = request.getParameterValues("ingredient");
        String[] steps = request.getParameterValues("step");

        for (String xx : steps)
            System.out.println(xx);

        System.out.println("-=-====");

        for (String x : ings)
            System.out.println(x);


        recipeService.add(recipe);
        return "redirect:/recipe/all";
    }

    List<String> stringToList(String string){

        String[] strings = string.split(", ");
        return new ArrayList<>(Arrays.asList(strings));
    }

}

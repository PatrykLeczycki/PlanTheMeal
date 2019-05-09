package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.patlec.dto.RecipeDto;
import pl.patlec.model.Recipe;
import pl.patlec.service.RecipeService;

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
        model.addAttribute("recipeDto", new RecipeDto());
        return "recipes/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("recipeDto") @Valid RecipeDto recipeDto, BindingResult result, HttpServletRequest request, Principal principal, Model model){

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
    private String edit(@PathVariable long id, Model model){

        model.addAttribute("recipe", recipeService.findById(id));
        model.addAttribute("ingredients", stringToList(recipeService.findById(id).getIngredients()));
        model.addAttribute("steps", stringToList(recipeService.findById(id).getPreparation()));


        return "recipes/edit";
    }

    @PostMapping("/edit")
    private String edit(@ModelAttribute("recipe") @Valid Recipe recipe, BindingResult result, HttpServletRequest request, Model model, Principal principal){

        String[] data = getDataFromRequest(request);
        recipe.setPreparation(data[0]);
        recipe.setIngredients(data[1]);

        if(result.hasErrors() || "".equals(recipe.getPreparation()) || "".equals(recipe.getIngredients())){

            if("".equals(recipe.getPreparation()))
                model.addAttribute("nopreparation", true);

            if("".equals(recipe.getIngredients()))
                model.addAttribute("noingredients", true);

            model.addAttribute("steps", stringToList(recipe.getPreparation()));
            model.addAttribute("ingredients", stringToList(recipe.getIngredients()));

            return "recipes/edit";
        }

        recipeService.edit(recipe, principal);
        return "redirect:/user/recipe/all";
    }

    public List<String> stringToList(String string){

        String[] strings = string.split(", ");
        return new ArrayList<>(Arrays.asList(strings));
    }

    public String[] getDataFromRequest(HttpServletRequest request){
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

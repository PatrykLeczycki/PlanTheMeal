package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.patlec.model.Prompt;
import pl.patlec.service.PlanService;
import pl.patlec.service.RecipeService;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final RecipeService recipeService;
    private final PlanService planService;
    private final Prompt prompt;

    @GetMapping("/")
    public String home(Model model){

        model.addAttribute("plans", planService.all().size());
        model.addAttribute("recipes", recipeService.all().size());

        return "index";
    }

    @GetMapping("/all")
    public String allRecipes(Model model){

        model.addAttribute("recipes", recipeService.all());

        if(prompt.contains("recipeinmeal")){
            model.addAttribute("deleteerror", true);
            prompt.getNames().remove("recipeinmeal");
        }

        return "recipes/all";
    }
}

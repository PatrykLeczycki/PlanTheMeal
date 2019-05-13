package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.patlec.model.Meal;
import pl.patlec.service.MealService;
import pl.patlec.service.PlanService;
import pl.patlec.service.RecipeService;
import pl.patlec.service.WeekdayService;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/meal")
public class MealController {

    private final MealService mealService;
    private final PlanService planService;
    private final RecipeService recipeService;
    private final WeekdayService weekdayService;

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("meal", new Meal());
        model.addAttribute("plans", planService.all());
        model.addAttribute("recipes", recipeService.all());
        model.addAttribute("weekdays", weekdayService.all());
        return "meals/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("meal") @Valid Meal meal, BindingResult result){

        if(result.hasErrors())
            return "meals/add";

        mealService.add(meal);
        return "redirect:/user/plan/details/" + meal.getPlan().getId();
    }

}

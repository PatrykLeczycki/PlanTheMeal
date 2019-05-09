package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.patlec.dto.PlanDto;
import pl.patlec.model.Meal;
import pl.patlec.model.Prompt;
import pl.patlec.model.Weekday;
import pl.patlec.service.MealService;
import pl.patlec.service.PlanService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/plan")
public class PlanController {

    private final PlanService planService;
    private final MealService mealService;
    private final Prompt prompt;

    @GetMapping("/all")
    public String all(Model model){
        model.addAttribute("plans", planService.all());

        if(prompt.doesContain("mealinplan")){
            model.addAttribute("deleteerror", true);
            prompt.getNames().remove("mealinplan");
        }

        return "plans/all";
    }

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("planDto", new PlanDto());
        return "plans/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("planDto") @Valid PlanDto planDto, BindingResult result, Principal principal){

        if(result.hasErrors())
            return "plans/add";

        planService.add(planDto, principal);

        return "redirect:/user/plan/all";
    }

    @GetMapping("/details/{id}")
    public String details(@PathVariable("id") Long id, Model model){

        model.addAttribute("weekplan", planDetails(id));
        return "plans/details";

    }

    public Map<String, List<Meal>> planDetails(Long id){
        List<Meal> allMeals = mealService.getAllByPlan(planService.getById(id));
        Map<String, List<Meal>> planDetails = new LinkedHashMap<>();

        if(!allMeals.isEmpty()){

            Weekday currentDay = allMeals.get(0).getWeekday();
            List<Meal> currentDayMeals = new ArrayList<>();

            for (Meal meal : allMeals){

                if (!meal.getWeekday().equals(currentDay)){
                    planDetails.put(currentDay.getName(), currentDayMeals);
                    currentDay = meal.getWeekday();
                    currentDayMeals = new ArrayList<>();
                }

                currentDayMeals.add(meal);
            }

            planDetails.put(currentDay.getName(), currentDayMeals);
        }

        return planDetails;
    }
}

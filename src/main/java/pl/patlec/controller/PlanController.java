package pl.patlec.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.patlec.dto.PlanDto;
import pl.patlec.model.*;
import pl.patlec.service.MealService;
import pl.patlec.service.PlanService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/plan")
public class PlanController {

    private final PlanService planService;
    private final MealService mealService;
    private final Prompt prompt;

    @GetMapping("/all")
    public String all(Model model, Principal principal){

        model.addAttribute("plans", planService.all());
        model.addAttribute("loggedUser", principal.getName());

        if(prompt.contains("mealinplan")){
            Long planId = Long.parseLong(prompt.getAdditionalInfo().get("mealinplanwithid"));
            model.addAttribute("mealinplan", true);
            model.addAttribute("planid", planId);
            prompt.getNames().remove("mealinplan");
        }

        if(prompt.contains("mealnotfound")){
            model.addAttribute("mealnotfound", true);
            prompt.getNames().remove("mealnotfound");
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

        Plan plan = planService.getById(id);
        model.addAttribute("weekplan", planDetails(id));
        model.addAttribute("planid", id);
        model.addAttribute("planname", plan.getName());
        model.addAttribute("plandesc", plan.getDescription());

        if(prompt.contains("mealnotfound")){
            prompt.getNames().remove("mealnotfound");
            model.addAttribute("mealnotfound", true);
        }

        if(prompt.contains("mealdeleted")){
            prompt.getNames().remove("mealdeleted");
            model.addAttribute("mealdeleted", true);
        }

        return "plans/details";

    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") long id, Model model){

        if(!Objects.isNull(planService.getById(id))){
            model.addAttribute("id", id);
            model.addAttribute("name", planService.getById(id).getName());
            model.addAttribute("description", planService.getById(id).getDescription());
            return "plans/edit";
        }

        prompt.add("plannotfound");
        return "redirect:/user/plan/all";
    }

    @PostMapping("/edit/{id}")
    public String edit(@PathVariable("id") long id, @RequestParam("name") String name, @RequestParam("description") String description, Model model){

        if(name.length() < 1 || description.length() < 1){
            if(name.length() < 1)
                model.addAttribute("emptyname", true);
            if(description.length() < 1)
                model.addAttribute("emptydesc", true);

            model.addAttribute("id", id);
            model.addAttribute("name", planService.getById(id).getName());
            model.addAttribute("description", planService.getById(id).getDescription());

            return "plans/edit";
        }

        Plan plan = planService.getById(id);
        plan.setName(name);
        plan.setDescription(description);
        planService.edit(plan);

        return "redirect:/user/plan/details/" + id;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deletePlan(@PathVariable("id") Long id, Principal principal){

        planService.delete(planService.getById(id), principal);
        return "redirect:/user/plan/all";
    }

    @RequestMapping(value = "/deletemeal/{mealid}", method = RequestMethod.GET)
    public String deleteMeal(@PathVariable("mealid") Long mealId, HttpServletRequest request){

        mealService.deleteMeal(mealId);
        String planId = request.getParameter("planid");

        return "redirect:/user/plan/details/" + Long.parseLong(planId);
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

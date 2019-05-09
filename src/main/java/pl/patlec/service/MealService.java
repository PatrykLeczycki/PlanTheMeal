package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.patlec.model.Meal;
import pl.patlec.model.Plan;
import pl.patlec.model.Recipe;
import pl.patlec.repo.MealRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MealService {

    private final MealRepository mealRepository;

    public void add(Meal meal){
        mealRepository.save(meal);
    }

    public List<Meal> all(){
        return mealRepository.findAll();
    }

    public List<Meal> getAllByPlan(Plan plan){
        return mealRepository.findAllByPlanOrderByWeekdayIdAscSequenceAsc(plan);
    }

    public Long countAllByPlan(Plan plan){
        return mealRepository.countAllByPlan(plan);
    }
    public Long countAllByRecipe(Recipe recipe){
        return mealRepository.countAllByRecipe(recipe);
    }
}

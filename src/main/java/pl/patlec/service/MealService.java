package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.patlec.model.Meal;
import pl.patlec.model.Plan;
import pl.patlec.model.Prompt;
import pl.patlec.model.Recipe;
import pl.patlec.repo.MealRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MealService {

    private final MealRepository mealRepository;
    private final Prompt prompt;

    public void add(Meal meal){
        mealRepository.save(meal);
    }

    public List<Meal> all(){
        return mealRepository.findAll();
    }

    public List<Meal> getAllByPlan(Plan plan){
        return mealRepository.findAllByPlanOrderByWeekdayIdAscSequenceAsc(plan);
    }

    public void deleteMeal(Long id){

        Optional<Meal> optionalMeal = mealRepository.findById(id);

        if(optionalMeal.isEmpty())
            prompt.add("mealnotfound");
        else {
            mealRepository.delete(optionalMeal.get());
            prompt.add("mealdeleted");
        }
    }

    public Long countAllByPlan(Plan plan){
        return mealRepository.countAllByPlan(plan);
    }
    public Long countAllByRecipe(Recipe recipe){
        return mealRepository.countAllByRecipe(recipe);
    }
}

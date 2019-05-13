package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.patlec.dto.RecipeDto;
import pl.patlec.model.Prompt;
import pl.patlec.model.Recipe;
import pl.patlec.model.User;
import pl.patlec.repo.RecipeRepository;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RecipeService {

    private final RecipeRepository recipeRepository;
    private final UserService userService;
    private final MealService mealService;
    private final Prompt prompt;

    public List<Recipe> all(){
        return recipeRepository.findAll();
    }

    public Recipe getById(Long id){

        Optional<Recipe> optionalRecipe = recipeRepository.findById(id);

        return optionalRecipe.orElse(null);
    }

    public Long countByUser(User user){
        return recipeRepository.countAllByAuthor(user);
    }

    public void add(RecipeDto recipeDto, Principal principal){

        Recipe recipe = new Recipe();

        recipe.setPreparationTime(recipeDto.getPreparationTime());
        recipe.setPreparation(recipeDto.getPreparation());
        recipe.setName(recipeDto.getName());
        recipe.setIngredients(recipeDto.getIngredients());
        recipe.setDescription(recipeDto.getDescription());
        recipe.setCreated(LocalDateTime.now());
        recipe.setAuthor(userService.findUserByEmail(principal.getName()));

        recipeRepository.save(recipe);

    }

    public void edit(Recipe recipe){
        recipe.setUpdated(LocalDateTime.now());
        recipeRepository.save(recipe);
    }

    public void delete(Recipe recipe, Principal principal){

        User loggedUser = userService.findUserByEmail(principal.getName());

        if(!loggedUser.equals(recipe.getAuthor()) && !userService.isAdmin(loggedUser)){
            prompt.add("accessdenied");
        }
        else if(mealService.countAllByRecipe(recipe) > 0)
            prompt.add("recipeinmeal");
        else recipeRepository.delete(recipe);
    }

}

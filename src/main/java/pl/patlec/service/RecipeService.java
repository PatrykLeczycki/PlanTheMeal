package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.patlec.model.Recipe;
import pl.patlec.repo.RecipeRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RecipeService {

    private final RecipeRepository recipeRepository;

    public List<Recipe> all(){
        return recipeRepository.findAll();
    }

    public Recipe findById(Long id){

        Optional<Recipe> optionalRecipe = recipeRepository.findById(id);

        return optionalRecipe.orElse(null);
    }

    public void add(Recipe recipe){
        recipeRepository.save(recipe);
    }

}

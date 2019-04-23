package pl.patlec.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.patlec.model.Recipe;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {


}

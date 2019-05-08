package pl.patlec.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.patlec.model.Recipe;
import pl.patlec.model.User;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    Long countAllByAuthor(User user);

}

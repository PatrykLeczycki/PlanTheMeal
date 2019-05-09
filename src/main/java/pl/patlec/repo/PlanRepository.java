package pl.patlec.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.patlec.model.Plan;
import pl.patlec.model.User;

public interface PlanRepository extends JpaRepository<Plan, Long> {

    Long countAllByAuthor(User user);
    Plan findTopByAuthorOrderByCreatedDesc(User user);
}

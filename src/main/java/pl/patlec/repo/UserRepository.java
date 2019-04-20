package pl.patlec.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.patlec.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);
}

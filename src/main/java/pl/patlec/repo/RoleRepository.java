package pl.patlec.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.patlec.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}

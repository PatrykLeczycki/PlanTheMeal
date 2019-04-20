package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.patlec.model.User;
import pl.patlec.model.UserDetailsImpl;
import pl.patlec.repo.UserRepository;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserRepository userRepository;

    public UserDetails loadUserByUsername(String email){

        User user = userRepository.findByEmail(email);
        if (Objects.isNull(user))
            throw new UsernameNotFoundException(email);

        return new UserDetailsImpl(user);
    }

}

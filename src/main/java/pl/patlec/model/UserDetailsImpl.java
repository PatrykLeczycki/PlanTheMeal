package pl.patlec.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.stream.Collectors;

public class UserDetailsImpl extends User implements UserDetails {

    //Zamieniam usera na obiekt UserDetails
    public UserDetailsImpl(User user) {
        this.setEnabled(user.isEnabled());
        this.setPassword(user.getPassword());
        this.setRoleSet(user.getRoleSet());
        this.setEmail(user.getEmail());
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.getRoleSet().stream()
                .map(el -> new SimpleGrantedAuthority(el.getName()))
                .collect(Collectors.toList());
    }

    @Override
    public String getUsername() {
        return this.getEmail();
    }


    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
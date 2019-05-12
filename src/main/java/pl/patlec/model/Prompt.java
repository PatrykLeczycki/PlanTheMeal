package pl.patlec.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION,
        proxyMode = ScopedProxyMode.TARGET_CLASS)
@Data
@RequiredArgsConstructor
public class Prompt {
    private Set<String> names = new HashSet<>();

    private Map<String, String> additionalInfo;

    public boolean contains(String prompt){
        return names.contains(prompt);
    }

    public void add(String name){
        names.add(name);
    }
}

package pl.patlec;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * Ta adnotacja zastępuje nam adnotacje ze Spring Data takie jak:
 * 1. @Configuration
 * 2. @EnableAutoConfiguration
 * 3. @ComponentScan
 * Co z Enable Jpa Repositories, EntityScan? zajrzyj do POMa
 * Spring Boot konfigure powyzsze automatycznie
 */

@SpringBootApplication
public class Application extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Application.class);
    }
}

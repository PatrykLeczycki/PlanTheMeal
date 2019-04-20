package pl.patlec.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@RequiredArgsConstructor
@Data
public class UserDto {

    @NotNull
    @Size(min = 2, max = 20, message = "Name must have from 2 to 20 characters")
    private String name;

    @NotNull
    @Size(min = 2, max = 30, message = "Surname must have from 2 to 30 characters")
    private String surname;

    @NotNull
    @Pattern(regexp = "[_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.([a-zA-Z]{2,}){1}", message = "Wrong e-mail address format")
    private String email;

    @NotNull
    @Size(min = 8, message = "Password must have at least 8 characters")
    private String password;

    private String confirmPassword;

}

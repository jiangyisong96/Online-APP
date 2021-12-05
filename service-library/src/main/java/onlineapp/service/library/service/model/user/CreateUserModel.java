package onlineapp.service.library.service.model.user;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import java.time.LocalDate;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Create User Model to create user's info.
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateUserModel {

  @NotBlank private String name;

  private String email;

  @Positive private Long countryCode;

  @NotBlank private String contactNumber;

  @JsonSerialize(using = LocalDateSerializer.class)
  @JsonDeserialize(using = LocalDateDeserializer.class)
  @DateTimeFormat
  private LocalDate dateOfBirth;

  @NotNull private boolean enabled;
}

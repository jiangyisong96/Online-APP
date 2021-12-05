package onlineapp.service.library.service.model.user;

import java.io.Serializable;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * User Email Model
 *
 * @author Wen Xiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserEmailModel implements Serializable {

  private static final long serialVersionUID = 1L;

  @Positive private long userId;

  @NotBlank private String name;

  @NotBlank @Email private String email;
}

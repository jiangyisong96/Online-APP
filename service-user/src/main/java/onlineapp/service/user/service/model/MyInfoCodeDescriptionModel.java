package onlineapp.service.user.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyInfoCodeDescriptionModel {

  @NotBlank private String code;
  private String desc;
}

package onlineapp.service.library.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UploadModel {

  @NotBlank private String key;
  @NotBlank private String presignedUrl;
}

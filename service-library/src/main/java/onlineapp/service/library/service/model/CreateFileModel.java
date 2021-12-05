package onlineapp.service.library.service.model;

import javax.validation.constraints.NotBlank;
import lombok.Data;

/**
 * Create file model.
 *
 * @author XingJun
 */
@Data
public class CreateFileModel {

  @NotBlank private String fileName;
}

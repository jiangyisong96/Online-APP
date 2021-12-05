package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.FileStatus;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Update file moodel.
 *
 * @author XingJun
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateFileModel {

  @NotBlank private String uuid;

  private FileStatus fileStatus;
}

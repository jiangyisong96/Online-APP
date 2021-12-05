package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import onlineapp.service.library.enumeration.FileStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * File model.
 *
 * @author XingJun
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FileModel {

  private FileStatus fileStatus;

  // s3 pre-signed url
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String url;
}

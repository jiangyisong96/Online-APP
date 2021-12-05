package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.FileStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileEntityModel {
  private long id;
  private FileStatus fileStatus;
  private String uuid;
  private String fileName;
  private long fileSize;
}

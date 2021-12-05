package onlineapp.service.configuration.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateIExamConfigModel {
  private String label;
  private String key;
  private String value;
}

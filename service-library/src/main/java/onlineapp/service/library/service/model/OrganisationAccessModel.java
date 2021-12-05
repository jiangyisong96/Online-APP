package onlineapp.service.library.service.model;

import java.io.Serializable;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrganisationAccessModel implements Serializable {
  private String examCode;
  private List<String> modules;
}

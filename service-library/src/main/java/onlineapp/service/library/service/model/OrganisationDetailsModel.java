package onlineapp.service.library.service.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrganisationDetailsModel implements Serializable {
  private static final long serialVersionUID = 1L;

  String organizationName;
  String organizationCode;
  String organizationType;
  long organizationId;
}

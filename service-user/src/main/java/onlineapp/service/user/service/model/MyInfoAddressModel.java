package onlineapp.service.user.service.model;

import javax.validation.Valid;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class MyInfoAddressModel {

  @Valid private MyInfoCodeDescriptionModel country;
  @Valid private MyInfoValueModel unit;
  @Valid private MyInfoValueModel street;
  private String lastupdated;
  @Valid private MyInfoValueModel block;
  private String source;
  @Valid private MyInfoValueModel postal;
  private String classification;
  @Valid private MyInfoValueModel floor;
  private String type;
  @Valid private MyInfoValueModel building;

  @Valid private MyInfoValueModel line1;
  @Valid private MyInfoValueModel line2;
}

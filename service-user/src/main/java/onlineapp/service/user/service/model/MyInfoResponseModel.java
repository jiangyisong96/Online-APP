package onlineapp.service.user.service.model;

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
public class MyInfoResponseModel {

  private String lastupdated;
  private String classification;
  private MyInfoValueModel prefix;
  private MyInfoValueModel nbr;
  private MyInfoValueModel areacode;

  private String source;
  private String value;

  private String code;
  private String desc;
}

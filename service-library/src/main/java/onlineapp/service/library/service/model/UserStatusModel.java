package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class UserStatusModel {
  boolean blocked;
  boolean enabledToMt;
}

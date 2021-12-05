package onlineapp.service.user.service.model;

import brave.internal.Nullable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.checkerframework.checker.index.qual.Positive;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class NewRequestModel {

  /**
   * targetId of new request
   */
  @Positive long targetId;
  /**
   * description of new request
   */
  @Positive long approverId;

  /**
   * description of new request
   */
  @Nullable String description;
}

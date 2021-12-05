package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.UserEvent;
import java.io.Serializable;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * User event information to be put in the queue.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class UserEventModel extends EventModel {

  private UserEvent event;

  private long userId;

  private Serializable data;
}

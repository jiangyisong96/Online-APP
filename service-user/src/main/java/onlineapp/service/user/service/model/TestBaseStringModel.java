package onlineapp.service.user.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * One-time-password creation model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TestBaseStringModel {

  private String code;

  private String state;

  private String nonce;
}

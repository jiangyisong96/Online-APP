package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import java.io.Serializable;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * Captcha data model to hold captcha related fields
 *
 * @author Yucheng
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
@JsonInclude(Include.NON_NULL)
@ToString
public class CaptchaDataModel implements Serializable {
  private Integer maxAttempt;
  private Integer remainingAttempt;
  private Boolean isLocked;
  private Integer waitingTime;
}

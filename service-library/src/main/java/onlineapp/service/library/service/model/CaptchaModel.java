package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * Captcha model to hold request and response of google reCAPTCHA APIs
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
public class CaptchaModel {
  private String siteKey;
  private Event event;
  private Float score;
  private Boolean isBot;

  public void checkIsBot(Float scoreThreshold) {
    isBot = score <= scoreThreshold;
  }

  @Getter
  @Setter
  @NoArgsConstructor
  @AllArgsConstructor(access = AccessLevel.PRIVATE)
  @Builder
  @ToString
  public static class Event {
    @NotBlank @NotNull private String token;
    @NotBlank @NotNull private String siteKey;
  }
}

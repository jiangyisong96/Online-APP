package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Sms Model for sending Sms
 *
 * @author Shengwei
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SmsModel {

  // SMS API ID
  @JsonProperty("ID")
  private String id;

  // SMS API password
  @JsonProperty("Password")
  private String password;

  // recipient mobile number (single number, include country code and exclude “+” sign)
  @JsonProperty("Mobile")
  private String mobile;

  // Content Type, will always use A - ASCII content of less than 160 characters
  @JsonProperty("Type")
  private String type;

  @JsonProperty("Message")
  private String message;
}

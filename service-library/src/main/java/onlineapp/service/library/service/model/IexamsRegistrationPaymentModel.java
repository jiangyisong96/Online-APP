package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IexamsRegistrationPaymentModel {
  private Float gst;
  private Float gstPercentage;
  private Float fee;
}

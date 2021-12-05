package onlineapp.service.library.service.model.user;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

/**
 * Address Model to retrieve contact number info.
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AddressModel {

  @NotBlank
  @Length(max = 10)
  private String houseOrBlockNumber;

  @Length(max = 3)
  private String floorNumber;

  @Length(max = 5)
  private String unitNumber;

  @Length(max = 32)
  private String buildingName;

  @NotBlank
  @Length(max = 32)
  private String streetName;

  @NotBlank
  @Length(max = 6)
  private String postalCode;
}

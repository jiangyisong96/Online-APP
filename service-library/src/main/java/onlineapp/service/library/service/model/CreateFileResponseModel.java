package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * To return uuid after create file record.
 *
 * @author XingJun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreateFileResponseModel {

  private String uuid;
}

package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Resit Access Response Model to retrieve access rights of an individual
 *
 * @author Wen Xiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResitAccessResponseModel {
  private boolean payOnbehalf;

  private boolean sendBulkEmail;
}

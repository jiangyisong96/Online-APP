package onlineapp.service.library.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Generic Query Result Model
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GenericQueryResultModel {

  @NotBlank private String queryResult;
}

package onlineapp.service.library.service.model;

import java.io.Serializable;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.Nullable;

/**
 * Drop down list Model to store Drop down list data
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DropdownListModel implements Serializable {

  @NotBlank private String code;

  @Nullable private String description;
}

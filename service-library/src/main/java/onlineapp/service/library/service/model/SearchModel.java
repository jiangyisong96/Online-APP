package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Model for searching api.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SearchModel {

  /**
   * query of search model
   */
  @NotBlank private String q;

  @JsonIgnore
  public String getQuery() {
    return q;
  }
}

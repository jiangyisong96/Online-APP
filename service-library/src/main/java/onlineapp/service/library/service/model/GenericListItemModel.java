package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GenericListItemModel<T, J> {
  /**
   * id of target candidate
   */
  private T id;

  /**
   * name of target candidate
   */
  private J name;
}

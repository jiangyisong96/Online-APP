package onlineapp.service.library.repository.entity;

import javax.persistence.MappedSuperclass;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * code entity.
 *
 * @author WenXiang
 */
@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CodeTable extends LookUpTable {

  // TODO: To be removed for salutation and designation table
  //  once completed SEABMIEB-1722 and SEABMIEB-1723
  private String code;
}

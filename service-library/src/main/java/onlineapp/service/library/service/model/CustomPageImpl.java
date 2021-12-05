package onlineapp.service.library.service.model;

import java.util.List;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

public class CustomPageImpl<T> extends PageImpl<T> {

  long total;

  public CustomPageImpl(List<T> content, Pageable pageable, long total) {
    super(content, pageable, total);
    this.total = total;
  }

  public CustomPageImpl(List<T> content, long total) {
    super(content);
    this.total = total;
  }

  @Override
  public long getTotalElements() {
    return total;
  }
}

package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class IexamsResponseModel<T> {
  private boolean success;
  private T data;
  private String httpStatus;
  private String errCode;
  private String errMsg;
  private String errDesc;
  private String debugMsg;
  private String aclObj;
  private String pagingInfo;
}

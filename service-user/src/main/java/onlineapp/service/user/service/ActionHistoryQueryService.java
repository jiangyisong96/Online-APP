package onlineapp.service.user.service;

import onlineapp.service.user.service.model.ActionHistoryResponseModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ActionHistoryQueryService {
  Page<ActionHistoryResponseModel> getActionHistory(Long userId, Pageable pageRequest);
}

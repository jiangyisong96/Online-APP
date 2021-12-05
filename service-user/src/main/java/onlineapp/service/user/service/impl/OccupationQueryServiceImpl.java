package onlineapp.service.user.service.impl;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.OccupationRepository;
import onlineapp.service.user.repository.entity.Occupation;
import onlineapp.service.user.service.OccupationQueryService;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OccupationQueryServiceImpl implements OccupationQueryService {
  private static final Logger logger = LoggerFactory.getLogger(OccupationQueryServiceImpl.class);

  @Autowired private OccupationRepository occupationRepository;

  /** {@inheritDoc} */
  @Override
  public DropdownListModel findDefaultOccupation() {

    Optional<Occupation> optionalOccupation =
        occupationRepository.findByDescription(Constants.DEFAULT_OCCUPATION);

    if (optionalOccupation.isEmpty()) {
      logger.error(Constants.OCCUPATION_NOT_FOUND, Constants.DEFAULT_OCCUPATION);
      throw new ResourceNotFoundException(
          Constants.OCCUPATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }
    var occupation = optionalOccupation.get();

    return DropdownListModel.builder()
        .code(occupation.getUuid())
        .description(occupation.getDescription())
        .build();
  }
}

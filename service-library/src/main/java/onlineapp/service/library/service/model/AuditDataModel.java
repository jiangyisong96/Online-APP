package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.AccountType;
import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.logging.AuditEventStatus;
import java.io.Serializable;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Data model for audit log event to be used in the sqs message.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class AuditDataModel implements Serializable {
  private static final long serialVersionUID = 1L;

  private AccountType accountType;

  private String username;

  private String identityNumber;

  private UserType userType;

  private AuditActionType action;

  private String applicationId;

  private AuditEventStatus status;
}

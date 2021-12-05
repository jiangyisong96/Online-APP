package onlineapp.service.user.service.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import java.util.List;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * To retrieve user's related details and authorization details.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class UserDetailsModel {

  /**
   * CSRF token to be used for post/put/delete API.
   */
  private String csrfToken;

  /**
   * Display name of user
   */
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String displayName;

  /**
   * Organisation Name
   */
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String organisationName;

  /**
   * Roles that assigned to the user.
   */
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> roles;

  /**
   * Organisation Access
   */
  @JsonInclude(JsonInclude.Include.NON_EMPTY)
  private List<OrganisationAccessModel> organisationAccess;

  /**
   * Minutes of inactivity before log the user out in front end.
   */
  @JsonInclude(JsonInclude.Include.NON_EMPTY)
  private Integer inactivityMinutes;

  @JsonInclude(JsonInclude.Include.NON_EMPTY)
  private Boolean singpassUser;

  /**
   * Server Date Time
   */
  private String serverDateTime;
}

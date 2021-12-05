package onlineapp.service.user.service;

import onlineapp.service.user.service.model.ModuleNameModel;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Service to provide modules query.
 */
public interface ModuleQueryService {
  /**
   * Get all organisation modules for this coordinator.
   *
   * @param request Request
   * @param response Response
   * @return Return display_name of these Authorities as a list of ModuleNameModel.
   */
  List<ModuleNameModel> getOrganisationModule(HttpServletRequest request, HttpServletResponse response);

  /**
   * Get all modules for this admin.
   * @return Return display_name of these Authorities as a list of ModuleNameModel.
   */
  List<ModuleNameModel> getOpsAdminModule();
}

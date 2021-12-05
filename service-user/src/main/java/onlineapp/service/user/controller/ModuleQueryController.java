package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.user.service.ModuleQueryService;
import onlineapp.service.user.service.model.ModuleNameModel;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping()
public class ModuleQueryController {
  @Autowired private ModuleQueryService moduleQueryService;

  @PreAuthorize("hasAuthority('" + Authorities.ROLE_COORDINATOR + "')")
  @GetMapping("/user-modules")
  public ResponseEntity<List<ModuleNameModel>> getOrganisationModule(
      HttpServletRequest request, HttpServletResponse response) {
    return ResponseEntity.ok(moduleQueryService.getOrganisationModule(request, response));
  }

  @PreAuthorize("hasAuthority('" + Authorities.MODULE_EXAM_RESIT + "')")
  @GetMapping("/admin/user-modules")
  public ResponseEntity<List<ModuleNameModel>> getAdminModule() {
    return ResponseEntity.ok(moduleQueryService.getOpsAdminModule());
  }
}

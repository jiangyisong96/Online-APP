package onlineapp.service.user.service.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.user.ContactNumberModel;
import java.time.LocalDate;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 * Coordinator Details Model to retrieve coordinator's info.
 *
 * @author Wen Xiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class CoordinatorDetailsModel {

  @NotBlank private String coordinatorName;

  @NotBlank private String email;

  @NotNull
  @JsonFormat(pattern = "yyyy-MM-dd")
  @DateTimeFormat(iso = ISO.DATE)
  @Past
  private LocalDate dateOfBirth;

  @Valid private ContactNumberModel contactNumber;

  @Valid private DropdownListModel salutation;

  @Valid private DropdownListModel designation;

  @Valid private DropdownListModel organisation;
}

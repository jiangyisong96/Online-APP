package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import onlineapp.service.library.service.model.user.PersonnelModel;
import java.time.LocalDate;
import javax.validation.constraints.Past;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class PersonnelDetailsModel extends PersonnelModel {

  String uuid;

  @JsonFormat(pattern = "yyyy-MM-dd")
  @DateTimeFormat(iso = ISO.DATE)
  @Past
  private LocalDate dateOfBirth;

  private String race;

  private String gender;

  private String vehiclePlatId;

  private String accountStatus;

  private String lockStatus;
}

package onlineapp.service.library.repository.entity;

import onlineapp.service.library.enumeration.AttendanceStatus;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Parent class for personnel attendance and candidate attendance.
 *
 * @author Kuilin
 */
@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AbstractAttendance extends Auditable {

  @Column(columnDefinition = "timestamp")
  private LocalDateTime checkInTime;

  @Column(columnDefinition = "timestamp")
  private LocalDateTime checkOutTime;

  @Column(columnDefinition = "varchar(500)")
  private String remarks;

  @Enumerated(EnumType.STRING)
  @NotNull
  private AttendanceStatus attendanceStatus;
}

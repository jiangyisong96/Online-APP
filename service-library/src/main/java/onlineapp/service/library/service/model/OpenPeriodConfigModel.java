package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.time.LocalDateTime;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 * Open Period Config Model to retrieve open period config's info.
 *
 * @author Wen Xiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class OpenPeriodConfigModel implements Serializable {
  private static final long serialVersionUID = 1L;

  @NotBlank private String examLevelCode;

  @NotBlank private String configurationType;

  @NotNull
  @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
  @DateTimeFormat(iso = ISO.DATE_TIME)
  private LocalDateTime startDateTime;

  @NotNull
  @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
  @DateTimeFormat(iso = ISO.DATE_TIME)
  private LocalDateTime endDateTime;

  private String lastUpdatedBy;

  @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
  @DateTimeFormat(iso = ISO.DATE_TIME)
  private LocalDateTime lastUpdatedAt;
}

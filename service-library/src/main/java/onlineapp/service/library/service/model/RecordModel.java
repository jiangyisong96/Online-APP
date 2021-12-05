package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class RecordModel {

  @JsonProperty("eventVersion")
  private String version;

  @JsonProperty("eventSource")
  private String source;

  @JsonProperty("awsRegion")
  private String region;

  @JsonProperty("eventTime")
  private String eventTimestamp;

  @JsonProperty("eventName")
  private String name;

  @JsonProperty("s3")
  private S3EventDetailsModel s3EventDetails;
}

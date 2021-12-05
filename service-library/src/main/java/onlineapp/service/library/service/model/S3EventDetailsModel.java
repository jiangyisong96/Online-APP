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
public class S3EventDetailsModel {

  @JsonProperty("s3SchemaVersion")
  private String schemaVersion;

  @JsonProperty("configurationId")
  private String configurationId;

  @JsonProperty("object")
  private S3ItemModel item;
}

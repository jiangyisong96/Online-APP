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
public class S3ItemModel {

  @JsonProperty("key")
  private String key;

  @JsonProperty("size")
  private int size;

  @JsonProperty("eTag")
  private String eTag;

  @JsonProperty("versionId")
  private String versionId;

  @JsonProperty("sequencer")
  private String sequencer;
}

package onlineapp.service.user.elasticsearch.document;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.data.elasticsearch.annotations.InnerField;
import org.springframework.data.elasticsearch.annotations.MultiField;
import org.springframework.data.elasticsearch.annotations.Setting;

@Document(indexName = "account_details")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setting(settingPath = "es_setting.json")
public class AccountDetails {

  /** User Id, uuid */
  @Id private long id;

  @Field private String uuid;

  /** Username or 'Singpass User' if user is a CP Singpass user */
  @Field private String username;

  /** Name */
  @MultiField(
      mainField = @Field(value = "name", type = FieldType.Keyword),
      otherFields = {
        @InnerField(suffix = "lowercase", type = FieldType.Text, analyzer = "case_insensitive")
      })
  private String name;

  /** NRIC/FIN/Passport number */
  @MultiField(
      mainField = @Field(value = "candidateId", type = FieldType.Text, fielddata = true),
      otherFields = {
        @InnerField(suffix = "lowercase", type = FieldType.Text, analyzer = "case_insensitive")
      })
  private String candidateId;

  /** Date of birth */
  @Field private long dateOfBirth;

  /** Email address */
  @Field private String email;

  /** School name */
  @Field private String school;

  @Field private long organisationId;

  /** Status */
  @Field private String status;

  /** Creation date */
  @Field private long createdAt;

  /** Account type */
  @Field private String accountType;

  /** Account Status (ACTIVE, NON ACTIVATED) */
  @Field private String accountStatus;

  /** User Type (Candidate, Coordinator, Personnel, etc) */
  @JsonIgnore private String userType;
}

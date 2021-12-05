package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import onlineapp.service.library.logging.Sensitive;
import onlineapp.service.library.validator.Conditional;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(Include.NON_NULL)
@ToString
@Conditional(
    selected = "idType",
    values = {"I"},
    required = {"nric"})
@Conditional(
    selected = "idType",
    values = {"P"},
    required = {"foreignDocNo"})
@Conditional(
    selected = "cddtTypeCd",
    values = {"P"},
    required = {
      "emailLocalPart",
      "emailAtSign",
      "emailDomain",
      "prefContact",
      "mobilePrefix",
      "mobileCountryCode",
      "mobileNo",
      "prefAddr",
      "blkHseNo",
      "streetNm",
      "postalCd",
      "emargeName",
      "emargRelCd",
      "emergContactPrefix",
      "emergContactCountryCd",
      "emergContactNo"
    })
@Conditional(
    selected = "prefContact",
    values = {"T"},
    required = {"telephoneCountryCode", "telephoneNo", "telephonePrefix"})
@Conditional(
    selected = "prefAddr",
    values = {"F"},
    required = {"foreignAddr1"})
public class IexamsCandidateProfileModel {
  private char idType;
  @Sensitive private String nric;
  private Character cccInd;
  @Sensitive private String foreignDocNo;
  @NotBlank private String statutoryNm;
  private String hypyNm;
  private String chineseNm;
  @NotBlank private String genderTypeCd;
  @NotBlank private String birthDt;
  private String emailLocalPart;
  private Character emailAtSign;
  private String emailDomain;
  private Character prefContact;

  @Length(max = 1)
  private String telephonePrefix;

  private Long telephoneCountryCode;
  private String telephoneNo;

  @Length(min = 1, max = 1)
  private String mobilePrefix;

  private Long mobileCountryCode;
  private String mobileNo;
  @NotBlank private String raceCd;
  private String race2Cd;
  @NotBlank private String nationalityCd;
  private String nationalityIssueDt;
  @NotBlank private String prStatusCd;
  @NotBlank private String citizTypeCd;
  private Character prefAddr;
  private String blkHseNo;
  private String flrNo;
  private String unitNo;
  private String bldgNm;
  private String streetNm;
  private String postalCd;
  private String foreignAddr1;
  private String foreignAddr2;
  private String foreignAddr3;

  @NotBlank
  @Length(min = 1, max = 1)
  private String cddtTypeCd;

  private String emargeName;
  private String emargRelCd;

  @Length(max = 1)
  private String emergContactPrefix;

  private Long emergContactCountryCd;
  private String emergContactNo;
}

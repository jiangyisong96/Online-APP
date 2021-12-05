package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class IExamCandidateDetailModel {

  private char idType;
  private String nric;
  private String foreignDocNo;
  private String statutoryNm;
  private String chineseNm;
  private String hypyNm;

  @JsonFormat(pattern = "yyyy-MM-dd")
  @DateTimeFormat(iso = ISO.DATE)
  private LocalDate birthDt;

  private String genderTypeCd;
  private String nationalityCd;
  private String raceCd;
  private String race2Cd;

  private String emailLocalPart;
  private Character emailAtSign;
  private String emailDomain;

  private Character mobilePrefix;
  private Long mobileCountryCode;
  private String mobileNo;
  private Character telephonePrefix;
  private Long telephoneCountryCode;
  private String telephoneNo;
  private Character prefContact;

  @JsonFormat(pattern = "yyyy-MM-dd")
  @DateTimeFormat(iso = ISO.DATE)
  private LocalDate nationalityIssueDt;

  private String citizTypeCd;
  private String prStatusCd;
  private String cddtTypeCd;
  private String emargRelCd;

  private String postalCd;
  private String streetNm;
  private String bldgNm;
  private String flrNo;
  private String unitNo;
  private String blkHseNo;
  private String foreignAddr3;
  private String foreignAddr2;
  private String foreignAddr1;
  private Character prefAddr;

  private String emargeName;
  private Character emergContactPrefix;
  private Long emergContactCountryCd;
  private String emergContactNo;
  private String status;
}

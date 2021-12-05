package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Subject Info Model to retrieve private candidate's subject information.
 *
 * @author Wen Xiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SubjectInfoModel {
  private String code;
  private String examLevelCode;
  private String examLevelDescription;
  private String examSeriesCode;
  private String examSeriesDescription;
  private String groupCode;
  private String groupDescription;
  private String nameCode;
  private String nameDescription;
  private String levelCode;
  private String levelDescription;
  private String paperNumberCode;
  private String paperNumberDescription;
  private String modeOfAssessmentCode;
  private String modeOfAssessmentDescription;
  private String gstRegistrationNumber;
  private String examFee;
  private String totalExamFee;
  private String gst;
}

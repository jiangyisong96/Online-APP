package onlineapp.service.library.service.model;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Subject Summary Model to retrieve private candidate's subject information.
 *
 * @author Wen Xiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SubjectSummaryModel {
  private List<SubjectInfoModel> subjectInfo;

  private String examYear;

  private String examLevel;

  private String gstRegNo;

  private String gstPercentage;

  private String totalExamFee;

  private String totalGst;

  private String totalFee;
}

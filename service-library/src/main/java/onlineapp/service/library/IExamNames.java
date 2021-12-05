package onlineapp.service.library;

/**
 * Application constants used for iExams2 related values.
 */
public final class IExamNames {

  private IExamNames() {

  }
  // configuration table
  // top level
  public static final String APPEAL_LISTING = "appealListing";
  // first level
  public static final String APPEAL = "appeal";
  public static final String RESULT_RELEASE = "resultRelease";
  public static final String RESIT_FOR_MT = "resitForMt";
  public static final String APPEAL_RATES = "appealRates";
  public static final String APPEAL_SUBJECT_ELIGIBILITY = "appealSubjectEligibility";
  public static final String APPEAL_GRADE_ELIGIBILITY = "appealGradeEligibility";
  public static final String GCEO = "GCEO";
  public static final String GCEA = "GCEA";
  // second level
  public static final String OPEN_DATE_TIME = "openDateTime";
  public static final String CLOSE_DATE_TIME = "closeDateTime";

  // iexam_master_code table
  // commonly used cd_type name
  public static final String EXAM_LVL_CD = "EXAM_LVL_CD";
  public static final String SUBJECT_LVL_CD = "SUBJECT_LVL_CD";
  public static final String EXAM_SERIES_CD = "EXAM_SERIES_CD";
  public static final String SUBJECT_GROUP_CD = "SUBJECT_GROUP_CD";
  public static final String LANGUAGE_MED_CD = "LANGUAGE_MED_CD";
  public static final String MOA_CD = "MOA_CD"; // method of assessment, liken WRITTEN
  public static final String COUNTRY_CODE_CD = "COUNTRY_CODE_CD";
  // commonly used cd_code
  public static final String MY = "MY"; // mid-year
  public static final String SG_CODE = "65";
}

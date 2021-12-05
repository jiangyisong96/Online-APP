package onlineapp.service.library;

/**
 * Cache Name Constants.
 *
 * @author XingJun
 */
public class CacheNames {

  // Service Config
  public static final String CACHE_EXAM_LEVEL_CODES = "examLevelCodes";

  // Service User
  public static final String CACHE_ORGANISATIONS = "organisations";

  // Service Candidate
  public static final String CACHE_RESIT_PRICING = "resitPricing";
  public static final String CACHE_RESIT_SUBJECT = "resitSubject";
  public static final String CACHE_GCE_SUBJECT = "gceSubject";
  public static final String CACHE_GCE_RESULTS = "gceResults";
  public static final String CACHE_ORGANISATION_CONFIG = "organisationConfig";
  public static final String CACHE_TRANSACTION_DETAIL = "transactionDetail";
  public static final String CACHE_CANDIDATE_DETAILS = "candidateDetails";
  public static final String CACHE_EXAM_LEVELS = "examLevels";
  public static final String CACHE_EXAM_SERIES = "examSeries";
  public static final String CACHE_LANGUAGES = "languages";
  public static final String CACHE_NATIONAL_EXAM_LEVELS = "nationalExamLevels";
  public static final String CACHE_CANDIDATE_TYPES = "candidateTypes";
  public static final String CACHE_PAYMENT_MODES = "paymentMode";
  public static final String CACHE_OPEN_PERIOD_CONFIG = "openPeriodConfig";

  // Service Personnel
  public static final String CACHE_APPOINTMENT_NAME = "appointmentName";
  public static final String CACHE_EXAM_GROUP = "examGroup";
  public static final String CACHE_EXAM_CENTRE = "examCentre";

  /**
   * Constructs a new instance. With 'private' access modifier for preventing developer from
   * instantiation.
   */
  private CacheNames() {
    //
  }
}

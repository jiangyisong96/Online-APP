package onlineapp.service.library;

import onlineapp.service.library.enumeration.CaptchaModule;
import java.util.Arrays;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

/**
 * Application Constants.
 *
 * @author XingJun, Wen Xiang
 */
public class Constants {

  // Api path
  public static final String API_PATH_SIGNIN = "/signin";

  // Request header
  public static final String X_FORWARDED_FOR = "X-Forwarded-For";

  // SQS CONSTANTS
  public static final String PROCESSING = "PROCESSING";
  public static final String PROCESSED = "PROCESSED";

  // Customized HTTP status code
  public static final int CUSTOMIZED_UNAUTHORIZED_STATUS_CODE = 418;
  // Date time format
  public static final String DATETIME_FORMAT_WITH_MSEC = "yyyy-MM-dd'T'HH:mm:ss.SSS";
  public static final String DATETIME_FORMAT_WITHOUT_MSEC = "yyyy-MM-dd'T'HH:mm:ss";
  public static final String DATETIME_FORMAT_YMDHMS = "yyyy-MM-dd HH:mm:ss";
  public static final String IEXAMS_DATE_FORMAT = "yyyy-MM-dd";
  public static final String APPEAL_DATE_FORMAT = "dd MMM yyyy HH:mm";
  public static final String DATE_FORMAT = "dd MMM yyyy";
  public static final String DATE_TIME_FORMAT = "dd MMM yyyy HH:mm";
  public static final String ACCESS_ARRANGEMENT_DATE_FORMAT = "dd MMM yyyy HH:mm";
  public static final String BAD_REQUEST = "Bad Request";

  public static String PAYMENT_LINK_ROLE = "PAYMENT_LINK_ROLE";
  public static GrantedAuthority PAYMENT_LINK_ROLE_AUTH =
      new SimpleGrantedAuthority(PAYMENT_LINK_ROLE);

  // Special id to save in db
  public static final long ANONYMOUS_USER_ID = 0;
  public static final long BATCH_JOB_ID = -1;
  public static final String BATCH_JOB_ID_ATTR_NAME = "QUARTZID";

  // Candidate Profile Details
  public static final String PASSPORT = "PASSPORT";
  public static final char COUNTRY_CODE_PREFIX = '+';
  public static final char PASSPORT_PREFIX = 'P';
  public static final char NRIC_FIN_PREFIX = 'I';
  public static final char LOCAL_ADDRESS_PREFERRED = 'L';
  public static final char FORIEGN_ADDRESS_PREFERRED = 'F';
  public static final char MOBILE_NUMBER_PREFERRED = 'M';
  public static final char TELEPHONE_NUMBER_PREFERRED = 'T';
  public static final char CONTACT_PREFIX = '+';
  public static final char EMAIL_SIGN = '@';
  public static final int EMAIL_LOCAL_INDEX = 0;
  public static final int EMAIL_DOMAIN_INDEX = 1;

  // Generic error message
  public static final String FORBIDDEN = "User does not have access to this";
  public static final String KEY_VALUE_NOT_FOUND = "Key value not found!";
  public static final String INVALID_KEY_VALUE = "Invalid key value!";
  // Config query service
  public static final String FAIL_TO_FETCH_DATA =
      "FeignClient fails to get data from configuration service";
  public static final String SUCCEED_TO_GET_DATA =
      "Get and cache the cp-epp configuration from config service, {}";

  // Email service
  public static final String EMAIL_ATTACHMENT_ERROR =
      "Error occurred when adding attachment to email : {}";

  // Login user service
  public static final String NO_USER_LOGIN =
      "Can't get current user id, probably hasn't logged in yet.";
  public static final String UNKNOWN_USER_TYPE = "Unknown user type of the current logged in user.";

  // File related constant
  public static final String CONTENT_TYPE_ZIP = "application/zip";
  public static final String CONTENT_TYPE_PDF = "application/pdf";
  public static final String ZIP_TYPE = ".zip";
  public static final String PDF_TYPE = ".pdf";
  public static final String EXCEL_TYPE = ".xlsx";

  public static final String FILE_NOT_FOUND = "File not found";

  // SMS related
  public static final String SMS_DISABLED_EMAIL = "Sms disabled. Sending email instead.";
  public static final String SMS_RESULT = "SMS Response from API: {}";
  public static final String SMS_UNABLE_TO_SEND = "Unable to send out SMS";
  public static final String SMS_SENT_SUCCESSFUL = "SMS sent successfully.";

  // Aws secret key error message
  public static final String AWS_KEY_VALUE_NOT_FOUND = "Aws secret key's value not found.";
  public static final String AWS_INVALID_KEY_VALUE =
      "Key value doesn't match the value found in aws.";
  public static final String AWS_INVALID_REQUEST_PARAM =
      "Invalid request/parameter when retrieving secret key from aws.";

  public static final String FAIL_AUTHENTICATE_BATCH_JOB =
      "Fail to authenticate batch job due to null jwt token return.";

  // Session related attribute
  public static final String SPRING_SECURITY_CONTEXT = "SPRING_SECURITY_CONTEXT";

  // Payment related information
  public static final String PAYNOW_PREFIX = "PN";
  public static final String CREDIT_CARD_PREFIX = "CC";
  public static final String ENETS_CREDIT_CARD = "ENETS_CREDIT_CARD";
  public static final String BANK_TRANSFER = "BANK_TRANSFER";
  public static final String PAYNOW_QR = "PAYNOW_QR";

  // Audit logger related information
  public static final String AUDIT_MARKER = "AUDIT_EVENT";
  public static final long UNKNOWN_USER_ID = 0;
  public static final String UNKNOWN_SESSION_ID = "0";
  public static final String UNKNOWN_CLIENT_IP = "0";

  public static final String DEV = "DEV";
  public static final String CLOUD = "CLOUD";

  // Epp Domain Url keyword
  public static final String CP_DOMAIN_URL_KEYWORD = "myexams";
  public static final String EPP_DOMAIN_URL_KEYWORD = "myexamduty";

  // Header related information
  public static final String REQUEST_CONTEXT_HOST_NAME = "x-forwarded-host";
  public static final String REQUEST_CONTEXT_JWT = "JWTTOKEN";
  public static final String HEADER_COOKIE = "Cookie";
  public static final String COOKIE_IS_NULL = "Cookie value is null";
  public static final String REQUEST_ATTRIBUTES_IS_NULL = "Request attributes is null";
  public static final String JWT_SESSION = "JWTSESSION=";
  public static final String PORTAL_ATTRIBUTE_NAME = "PORTAL";
  public static final String PORTAL_TYPE_NOT_FOUND = "The portal type is not found. {}";
  public static final String HOST_NAME_NOT_FOUND = "The host name is not found. {}";

  // Pagination Information
  public static final int PAGE_SIZE = 5;

  // Iexams  Encryption related information
  public static final String ALGORITHM = "RSA/ECB/OAEPWithMD5AndMGF1Padding";
  public static final String KEY_ALGORITHM = "RSA";
  public static final String SIGNING = "SHA256withRSA";
  public static final String IEXAMS_HEADER_APP_ID = "iEXAMS2_EG_app_id";
  public static final String IEXAMS_HEADER_API_KEY = "iEXAMS2_EG_APIKey_enc";
  public static final String IEXAMS_HEADER_NONCE = "iEXAMS2_EG_nonce";
  public static final String IEXAMS_HEADER_SIGNATURE = "iEXAMS2_EG_signature";
  public static final String IEXAMS_HEADER_TIMESTAMP = "iEXAMS2_EG_timestamp";
  public static final String IEXAMS_HEADER_DATAKEY = "iEXAMS2_EG_datakey_enc";
  public static final String IEXAMS_HEADER_TOKEN = "iEXAMS2_EG_token";
  public static final String IEXAMS_RESPONSE_HEADER_APP_ID = "iexams2_eg_appid";
  public static final String IEXAMS_RESPONSE_HEADER_NONCE = "iexams2_eg_nonce";
  public static final String IEXAMS_RESPONSE_HEADER_SIGNATURE = "iexams2_eg_signature";
  public static final String IEXAMS_RESPONSE_HEADER_TIMESTAMP = "iexams2_eg_timestamp";
  public static final String IEXAMS_RESPONSE_HEADER_DATAKEY = "iexams2_eg_datakey_enc";
  public static final String APP_ID = "CPEP";
  public static final String BODY_KEY_ALGORITHM = "AES";
  public static final String BODY_ENCRYPTION_ALGORITHM = "AES/GCM/NoPadding";
  public static final String BOUNCY_CASTLE_PROVIDER = "BC";
  public static final String NONCE_ALGORITHM = "SHA1PRNG";
  public static final String REQUESTED_HEADER_UNAVAILABLE = "Required header is not available";
  public static final String SIGNATURE_WRONG = "SIGNATURE IS WRONG";

  // Iexams
  public static final String APPLICATION_EXAM_LEVEL_CODE = "APPL_EXAM_LVL_CD";
  public static final String EXAM_LEVEL_CODE = "EXAM_LVL_CD";
  public static final List<String> GCE_NA_NT_LEVEL =
      Arrays.asList("GCE N(A)-LEVEL", "GCE N(T)-LEVEL");
  public static final String GCE_NA_LEVEL = "GCE N-LEVEL";
  public static final String IEXAMS_RESPONSE_LOG_MESSAGE = "{} IEXAMS RESPONSE BODY : {} , Status Code : {}";

  // Lookup Table Query
  public static final List<String> GCE_EXAM_REGISTRATION_CODES =
      Arrays.asList("GCEA", "GCENA", "GCENT", "GCEO");
  public static final List<String> NATIONAL_EXAM_LEVEL_CODES =
      Arrays.asList("GCEA", "GCEN", "GCEO", "PSLE");
  public static final List<String> NON_NATIONAL_EXAM_REGISTRATION_CODES =
      Arrays.asList("SPE", "SPERS", "SAEIS", "AEIS");
  public static final List<String> PSLE_EXAM_REGISTRATION_CODES = Arrays.asList("PSLE");
  public static final List<String> IPSLE_EXAM_REGISTRATION_CODES = Arrays.asList("IPSLE");
  public static final String EXAM_LEVEL_NOT_FOUND = "The exam level could not not found. {}";

  // Organisation Access Related Information
  public static final String ORGANISATION_ACCESS_NOT_FOUND =
      "The organisation access could not be found. {}";

  // Candidate Criteria Query Fields
  public static final String FIELD_USER_NAME = "name";
  public static final String FIELD_CANDIDATE_ID = "candidateId";
  public static final String ORDER_ASCENDING = "asc";
  public static final String ORDER_DESCENDING = "desc";

  // Captcha Session Attributes
  public static final String FAILED_ATTEMPTS = "_FAILED_ATTEMPTS";
  public static final String IS_UNLOCKED = "_IS_UNLOCKED";
  public static final String CAPTCHA_CHECK = "_CAPTCHA_CHECK";
  public static final String MODULE = "MODULE";
  public static final String LOGIN_FAILED_ATTEMPTS = CaptchaModule.LOGIN.name() + FAILED_ATTEMPTS;
  public static final String LOGIN_IS_UNLOCKED = CaptchaModule.LOGIN.name() + IS_UNLOCKED;
  public static final String LOGIN_CAPTCHA_CHECK = CaptchaModule.LOGIN.name() + CAPTCHA_CHECK;
  public static final String WAITING_TIME = "WAITING_TIME";
  public static final String END_TIME = "END_TIME";
  public static final String SESSION_IS_LOCKED = "Session is locked";

  // Batch Job Logging Pattern
  public static final String JOB_STARTED = "{} has started.";
  public static final String JOB_ENDED = "{} has ended successfully without exception.";
  public static final String JOB_EXCEPTION = "{} has thrown exception.";

  // Paper
  public static final String PAPER_NOT_FOUND = "Paper is not found.";

  // String Manipulation
  public static final String COMMA = ", ";
  public static final String LINE_BREAK = "\n";

  // Prevent class instantiation
  private Constants() {
  }
}

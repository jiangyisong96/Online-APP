package onlineapp.service.user;

import onlineapp.service.user.enumeration.AuthorityType;
import java.util.List;

public class Constants {

  public static final String CONTENT_TYPE_JSON = "application/json";
  public static final String MESSAGE = "message";
  public static final String INVALID_ID = "ID not found {}";
  public static final String INVALID_USER = "INVALID USER";
  public static final String NOT_APPLICABLE = "N/A";
  public static final String CONTACT_NOT_FOUND = "contact detail not found";
  public static final String BLOCK_UNBLOCK = "BLOCK_UNBLOCK";
  public static final String USER_NOT_FOUND = "The user could not be found.";
  public static final String PASSWORD_EXPIRED = "Password has expired!";
  public static final String NO_MOBILE_NUMBER = "User does not have mobile number!";
  public static final String DEFAULT_OCCUPATION = "N/A";
  public static final String DEFAULT_COUNTRY_CODE = "65";

  public static final String STRING_JOIN_DELIMITER = " , ";
  // APPROVAL TASKLIST
  public static final String REQUEST_PENDING = "Currently there is request still in pending";
  public static final String CREATE = "CREATE";
  public static final String BLOCKED = "BLOCKED";
  public static final String ACTIVE = "ACTIVE";
  public static final String NOT_ACTIVATED = "NOT ACTIVATED";
  public static final String LOCKED = "LOCKED";
  public static final String NOT_LOCKED = "NOT LOCKED";
  public static final String NOT_BLOCKED = "NOT BLOCKED";
  public static final String UNLOCK = "UNLOCK";
  public static final String PENDING_ACCOUNT_CREATION = "PENDING ACCOUNT CREATION APPROVAL";
  public static final String APPROVER = "ROLE_ACCOUNT_APPROVER";
  public static final String NO_APPROVER_ROLE = "No approver role.";
  public static final String TASKLIST_URL = "admin/tasklist";
  public static final String ACCOUNT_TYPE_CANDIDATE = "Candidate";
  public static final String USER_TYPE_CANDIDATE = "candidate";
  public static final String ACCOUNT_TYPE_COORDINATOR = "Coordinator";
  public static final String USER_TYPE_COORDINATOR = "coordinator";
  public static final String USER = "Users";
  public static final String CP_USER_ACCOUNT_TYPE = "LOCAL";
  public static final String SINGPASS_USER_ACCOUNT_TYPE = "SINGPASS_USER";
  public static final String SINGPASS_USER_DEFAULT_USERNAME = "SingPass User";
  public static final String NON_SINGPASS_USER_DEFAULT_ADMINID = "-";
  // Session related attribute name
  public static final String USER_PRINCIPAL = "USER_PRINCIPAL";
  // Using this as code in IEXAMS is only 4 char
  public static final long MOE_CENTRE_TYPE_KEY_ID = 10000;
  public static final String MOE_CENTRE_TYPE_VALUE = "MOE Schools";
  // Database name used for audit log
  public static final String USER_CREDENTIALS_TABLE = "user_credentials";
  public static final String USER_TABLE = "user";
  // IEXAM Master Code Types
  public static final String RACE_CODE_TYPE = "RACE_CD";
  public static final String GENDER_CODE_TYPE = "GENDER_TYPE_CD";
  public static final String COUNTRY_CODE_TYPE = "COUNTRY_CODE_CD";
  public static final String NATIONALITY_CODE_TYPE = "NATIONALITY_CD";
  public static final String CITIZENSHIP_CODE_TYPE = "CITIZ_TYPE_CD";
  public static final String PR_STATUS_CODE_TYPE = "PR_STATUS_CD";
  public static final String RELATIONSHIP_CODE_TYPE = "RELATIONSHIP_CD";
  // IEXAM Master Code drop-down list Keys
  public static final String RACE = "race";
  public static final String GENDER = "gender";
  public static final String COUNTRY_CODE = "countryCode";
  public static final String NATIONALITY = "nationality";
  public static final String CITIZENSHIP = "citizenship";
  public static final String PR_STATUS = "prStatus";
  public static final String RELATIONSHIP = "relationship";
  public static final String SALUTATION = "salutation";
  public static final String DESIGNATION = "designation";
  public static final String OCCUPATION = "occupation";
  public static final List<AuthorityType> validTypes =
      List.of(AuthorityType.ADMIN_MODULE, AuthorityType.USER_MODULE);
  // Organisation info
  public static final String ORGANISATION_NOT_FOUND = "The organisation could not be found. {}";
  public static final String NO_ORGANISATION_BE_FOUND = "The organisation could not be found. {}";
  public static final String NO_ORGANISATION = "No organisation";
  public static final String NO_ORGANISATION_NAME = "No organisation name";
  // Candidate / Coordinator Information
  public static final String CANDIDATE_NOT_FOUND = "The candidate could not be found. {}";
  public static final String PARTIAL_CANDIDATE_NOT_FOUND =
      "Some of these candidate's email could not be found. {}";

  public static final String SALUTATION_NOT_FOUND = "The salutation could not be found. {}";
  public static final String DESIGNATION_NOT_FOUND = "The designation could not be found. {}";
  public static final String APPROVER_NOT_FOUND = "The approver could not be found.";
  public static final String INVALID_APPROVER = "Invalid Approver.";
  public static final String COORDINATOR_NOT_FOUND = "The coordinator could not be found. {}";
  public static final String EXISTING_CANDIDATE =
      "There is already a record for the following candidate. {}";
  public static final String EXISTING_COORDINATOR =
      "There is already a record for the following coordinator. {}";
  public static final String EXISTING_PERSONNEL =
      "There is already a record for the following personnel.";
  public static final String MISSING_INFORMATION = "There is required information not provided.";
  public static final String NO_ROLE_FOUND = "The role could not be found.";
  public static final String COUNTRY_CODE_PREFIX = "+";
  // Personnel Information
  public static final String PERSONNEL_NOT_FOUND = "The personnel could not be found. {}";
  public static final String NO_ACCESS_UPDATING_PROFILE =
      "You don't have access to update this profile.";
  // Resit Related Information
  public static final String RESIT = " resit";
  public static final String GCEO = "GCEO";
  public static final String GCEA = "GCEA";
  // Role related Information
  public static final String ROLE_NAME_FORMAT = "ROLE_%s";
  public static final String INVALID_ROLE = "Invalid Role or Authority!";
  // Authority Related Information
  public static final String MODULE_RESIT_PAYMENT = "MODULE_RESIT_PAYMENT";
  public static final String MODULE_EXAM_RESIT = "MODULE_EXAM_RESIT";
  public static final String AUTHORITY_NOT_FOUND = "The authority could not be found. {}";
  // Organisation Access Related Information
  public static final String ORGANIZATION_NO_ACCESS_TO = "The organisation doesn't have access to";
  // Ops-Admin Related Information
  public static final String CREATE_CANDIDATE_ACCOUNT_ERROR =
      "Unexpected error occurred when trying to save candidate ";
  public static final String BULK_CANDIDATE_CREATE_ERROR =
      "Bulk candidate creation: Error when creating account for candidate id: {}";
  public static final String ADMIN_NOT_FOUND = "The admin could not be found. {}";
  // Account management
  public static final String LOWERCASE_NAME = "name.lowercase";
  public static final String LOWERCASE_CANDIDATEID = "candidateId.lowercase";
  public static final String USER_TYPE = "userType";
  public static final String ACCOUNT_STATUS = "accountStatus";
  public static final String STATUS = "status";
  public static final String ORGANISATION_ID = "organisationId";
  public static final String LOWERCASE_EMAIL = "email.lowercase";
  public static final String INFO_INVALID = "Information is not valid.";
  public static final String INPUT_NULL = "Missing required parameter.";
  // Reset password command
  public static final String USER_BIRTHDAY_NOT_MATCH = "The user birthday do not match.";
  public static final String SINGPASS_USER = "The user is a Singpass User";
  public static final String UNACTIVATED_USER = "The user is not activated.";
  public static final String ACTIVATED_USER = "You have already activated your account.";
  public static final String BLOCKED_USER = "The user is blocked.";
  public static final String LOCKED_USER = "The user is locked.";
  public static final String MESSAGING_EXCEPTION = "Unable to send email";
  public static final String PORTAL_NOT_MATCH = "The user is not accessing the correct portal.";

  public static final String INVALID_PASSWORD =
      "Invalid Password! Please do not use your last %d password, your username, or an easily guessable password as your password.";
  public static final String LINK_EXPIRED = "The link has expired. {}";
  public static final String USER_VIA_LINK_NOT_FOUND =
      "The user with specified reset link could not be found. {}";
  // SingPass query service
  public static final String STATE = "state";
  public static final String NONCE = "nonce";
  // Singpass command service
  public static final String SESSION_COOKIE_NOT_FOUND = "Session not found in cookie";
  public static final String STATE_OR_NONCE_NOT_FOUND = "State or Nonce not found in session!";
  public static final String SINGPASS_ID_TOKEN_NOT_FOUND =
      "Unable to retrieve Singpass Id Token. {}";

  // Task command service
  public static final String FIELD_CREATED_AT = "createdAt";
  // User query service
  public static final String USER_CREDENTIALS_NOT_FOUND = "User Credentials Record not found.";
  public static final String LOCK_MESSAGE_SECONDS =
      "Your account is currently locked. Please try again.";

  // SIngpass MyInfo
  public static final String SANDBOX = "SANDBOX";
  public static final String TEST = "TEST";
  public static final String PROD = "PROD";
  public static final String APP_ID = "app_id";
  public static final String CLIENT_ID = "client_id";
  public static final String CLIENT_SECRET = "client_secret";
  public static final String CODE = "code";
  public static final String GRANT_TYPE = "grant_type";
  public static final String REDIRECT_URI = "redirect_uri";
  public static final String SIGNATURE_METHOD = "signature_method";
  public static final String TIMESTAMP = "timestamp";
  public static final String ATTRIBUTE = "attributes";
  public static final String TRANSACTION_NO = "txnNo";
  public static final String RS256 = "RS256";
  public static final String AUTHORIZATION_CODE = "authorization_code";
  public static final String AUTHORIZATION = "Authorization";
  public static final String ACCESS_TOKEN = "access_token";
  public static final String POST_METHOD = "POST";
  public static final String GET_METHOD = "GET";
  public static final String NO_CACHE = "no-cache";
  public static final String CACHE_CONTROL = "Cache-Control";
  public static final String CONTENT_TYPE = "Content-Type";
  public static final String APPLICATION_JSON = "application/json";

  public static final String SIGNATURE = "signature";
  public static final String PKI_SIGN = "PKI_SIGN";
  public static final String BEARER = "Bearer";
  public static final String YES = "Y";
  public static final String NO = "N";

  public static final String SPESVC_ID = "sp_esvcId";
  public static final String NMOE = "NMOE";
  public static final String MOE = "MOE";
  public static final String INVALID_ACCESS_MESSAGE = "Invalid access detected!";

  // Occupation Info
  public static final String OCCUPATION_NOT_FOUND = "The occupation could not be found. {}";
  public static final int FIRST_OCCUPATION = 1;
  public static final String PROFILE_ALREADY_EXIST = "A user with that profile already exists";
  public static final String PROFILE_IS_ACTIVE = "User is active";

  // IEXAMS RELATED
  public static final String CANDIDATE_TYPE_CD = "CANDIDATE_TYPE_CD";
  public static final String CITIZENSHIP_TYPE_CD = "CITIZ_TYPE_CD";
  public static final String GENDER_TYPE_CD = "GENDER_TYPE_CD";
  public static final String NATIONALITY_CD = "NATIONALITY_CD";
  public static final String PR_STATUS_CD = "PR_STATUS_CD";
  public static final String RELATIONSHIP_CD = "RELATIONSHIP_CD";
  public static final String RACE_CD = "RACE_CD";

  public static final List<String> CANDIDATE_PROFILE_REQUIRED_CODE =
      List.of(
          NATIONALITY_CD,
          CITIZENSHIP_TYPE_CD,
          GENDER_TYPE_CD,
          RACE_CD,
          CANDIDATE_TYPE_CD,
          PR_STATUS_CD,
          RELATIONSHIP_CD);

  // Candidate Criteria Query Fields
  public static final String FIELD_CANDIDATE_TYPE = "candidateType";

  // EP Employment Scheme (Dummy Data)
  public static final String EMPLOYMENT_SCHEME_TEST_SAMPLE = "Test Sample";
  public static final String EMPLOYMENT_SCHEME_SEAB_BASIC_USER = "SEAB Basic User";
  public static final String EMPLOYMENT_SCHEME_SCHOOL_TEACHER = "School Teacher";
  public static final String EMPLOYMENT_SCHEME_EXTERNAL = "External";
  public static final String EMPLOYMENT_SCHEME_RETIRED_TEACHER = "Retired Teacher";

  private Constants() {}
}

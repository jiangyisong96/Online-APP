package onlineapp.service.library;

/**
 * Authorities Constants.
 *
 * @author Kuilin
 */
public class Authorities {

  public static final String USER_READ = "USER_READ";
  public static final String USER_WRITE = "USER_WRITE";
  public static final String ACCOUNT_CREATION_READ = "ACCOUNT_CREATION_READ";
  public static final String ACCOUNT_BLOCK_READ = "ACCOUNT_BLOCK_READ";
  public static final String ACCOUNT_BLOCK_WRITE = "ACCOUNT_BLOCK_WRITE";
  public static final String ACCOUNT_CREATION_WRITE = "ACCOUNT_CREATION_WRITE";
  public static final String ACCOUNT_UNBLOCK_READ = "ACCOUNT_UNBLOCK_READ";
  public static final String ACCOUNT_UNBLOCK_WRITE = "ACCOUNT_UNBLOCK_WRITE";
  public static final String CONFIGURATION_READ = "CONFIGURATION_READ";
  public static final String CONFIGURATION_WRITE = "CONFIGURATION_WRITE";
  public static final String TASK_READ = "TASK_READ";
  public static final String TASK_WRITE = "TASK_WRITE";
  public static final String ADMIN_ROLE_READ = "ADMIN_ROLE_READ";
  public static final String ADMIN_ROLE_WRITE = "ADMIN_ROLE_WRITE";
  public static final String OPS_ADMIN_ACCOUNT_READ = "OPS_ADMIN_ACCOUNT_READ";
  public static final String OPS_ADMIN_ACCOUNT_WRITE = "OPS_ADMIN_ACCOUNT_WRITE";
  public static final String RESULT_RELEASE_READ = "RESULT_RELEASE_READ";
  public static final String RESULT_RELEASE_WRITE = "RESULT_RELEASE_WRITE";
  public static final String RESIT_READ = "RESIT_READ";
  public static final String RESIT_WRITE = "RESIT_WRITE";
  public static final String MODULE_EXAM_REGISTRATION = "MODULE_EXAM_REGISTRATION";
  public static final String MODULE_REGISTRATION_PAYMENT = "MODULE_REGISTRATION_PAYMENT";
  public static final String MODULE_EXAM_RESIT = "MODULE_EXAM_RESIT";
  public static final String MODULE_RESIT_PAYMENT = "MODULE_RESIT_PAYMENT";
  public static final String MODULE_RESULT_RELEASE = "MODULE_RESULT_RELEASE";
  public static final String ADMIN_MODULE_CREATE_CANDIDATE = "ADMIN_MODULE_CREATE_CANDIDATE";
  public static final String ADMIN_MODULE_CREATE_COORDINATOR = "ADMIN_MODULE_CREATE_COORDINATOR";
  public static final String ADMIN_MODULE_CREATE_PERSONNEL = "ADMIN_MODULE_CREATE_PERSONNEL";
  public static final String ADMIN_MODULE_BLOCK = "ADMIN_MODULE_BLOCK";
  public static final String ADMIN_MODULE_UNBLOCK = "ADMIN_MODULE_UNBLOCK";
  public static final String ADMIN_MODULE_UNLOCK = "ADMIN_MODULE_UNLOCK";
  public static final String ADMIN_MODULE_RESET_PASSWORD = "ADMIN_MODULE_RESET_PASSWORD";
  public static final String ADMIN_MODULE_OPEN_PERIOD = "ADMIN_MODULE_OPEN_PERIOD";
  public static final String ADMIN_MODULE_AUDIT_TRANSACTION = "ADMIN_MODULE_AUDIT_TRANSACTION";
  public static final String ADMIN_MODULE_RESIT_REPORT = "ADMIN_MODULE_RESIT_REPORT";
  public static final String ADMIN_MODULE_ACCESS_CONFIGURATION =
      "ADMIN_MODULE_ACCESS_CONFIGURATION";
  public static final String MODULE_RESULT_APPEAL = "MODULE_RESULT_APPEAL";
  public static final String ADMIN_MODULE_APPEAL_REPORT = "ADMIN_MODULE_APPEAL_REPORT";

  public static final String ROLE_CANDIDATE = "ROLE_CANDIDATE";
  public static final String ROLE_COORDINATOR = "ROLE_COORDINATOR";
  public static final String ROLE_OPS_ADMIN = "ROLE_OPS_ADMIN";
  public static final String ROLE_SYSTEM_ADMIN = "ROLE_SYSTEM_ADMIN";
  public static final String ROLE_PERSONNEL = "ROLE_PERSONNEL";

  public static final String PAYMENT_LINK_ROLE = "PAYMENT_LINK_ROLE";
  public static final String ROLE_BATCH_JOB = "ROLE_BATCH_JOB";
  public static final String ROLE_CP_USER = "ROLE_CP_USER";
  public static final String ROLE_EPP_USER = "ROLE_EPP_USER";

  public static final String MODULE_ACCESS_ARRANGEMENT = "MODULE_ACCESS_ARRANGEMENT";

  /**
   * Constructs a new instance. With 'private' access modifier for preventing developer from
   * instantiation.
   */
  private Authorities() {
    //
  }
}

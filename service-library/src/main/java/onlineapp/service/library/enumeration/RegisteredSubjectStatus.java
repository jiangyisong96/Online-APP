package onlineapp.service.library.enumeration;

/**
 * Used in Exam Registration Subjects and Papers. DRAFT is for registration before payment and
 * duplicate copy is draft for amendment. REGISTERED is for payment done successfully. ADDED is for
 * added during amendment and charges for payment. DELETED is for removed during amendment and
 * refund for payment. UPDATED is for changed in paper during amendment and charged for payment.
 * DRAFT_ADDED, DRAFT_DELETED, DRAFT_UPDATED is statuses for draft amendment.
 */
public enum RegisteredSubjectStatus {
  DRAFT,
  DRAFT_ADDED,
  DRAFT_DELETED,
  DRAFT_UPDATED,
  REGISTERED,
  ADDED,
  DELETED,
  UPDATED
}

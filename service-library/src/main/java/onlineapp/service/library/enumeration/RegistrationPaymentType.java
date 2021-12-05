package onlineapp.service.library.enumeration;

import java.util.Collections;
import java.util.List;

public enum RegistrationPaymentType {
  PAYNOW(Collections.singletonList(PaymentMode.PAYNOW), "PayNow"),
  CREDIT_DEBIT_CARD(
      List.of(
          PaymentMode.NETS_CC, PaymentMode.NETS_DD, PaymentMode.NETS_QR, PaymentMode.CREDIT_CARD),
      "Credit/Debit Card"),
  NO_PAYMENT_REQUIRED(
      Collections.singletonList(PaymentMode.NO_PAYMENT_REQUIRED), "No Payment Required"),
  OFFLINE(Collections.singletonList(PaymentMode.OFFLINE), "Offline Payment");

  private final List<PaymentMode> mode;
  private final String description;

  RegistrationPaymentType(List<PaymentMode> mode, String description) {
    this.mode = mode;
    this.description = description;
  }

  public static RegistrationPaymentType valueOfPaymentMode(PaymentMode paymentMode) {
    if (PAYNOW.mode.contains(paymentMode)) {
      return PAYNOW;
    } else if (CREDIT_DEBIT_CARD.mode.contains(paymentMode)) {
      return CREDIT_DEBIT_CARD;
    } else if (NO_PAYMENT_REQUIRED.mode.contains(paymentMode)) {
      return NO_PAYMENT_REQUIRED;
    } else {
      return OFFLINE;
    }
  }

  public List<PaymentMode> getMode() {
    return mode;
  }

  public String getDescription() {
    return description;
  }
}

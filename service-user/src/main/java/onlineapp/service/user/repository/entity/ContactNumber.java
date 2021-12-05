package onlineapp.service.user.repository.entity;

import onlineapp.service.library.repository.entity.Auditable;
import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Contact Number Entity.
 *
 * @author WenXiang
 */
@Entity
@Table(name = "contact_number")
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
@Builder
public class ContactNumber extends Auditable implements Serializable {

  private static final long serialVersionUID = 2837296218824261628L;
  /** id of contactNumber */
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  /** type of contactNumber */
  @NotBlank private String type;

  /** countryCode of contactNumber */
  @Column(length = 4)
  @Positive
  private Long countryCode;

  /** number of contactNumber */
  @Column(length = 8)
  @NotBlank
  private String number;

  /** isPreferredContact of contactNumber */
  @Column(columnDefinition = "boolean default false")
  @NotNull
  private boolean isPreferredContact;

  public ContactNumber(String type, Long countryCode, String number, boolean isPreferredContact) {
    this.type = type;
    this.countryCode = countryCode;
    this.number = number;
    this.isPreferredContact = isPreferredContact;
  }

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object contactNumber) {
    if (this == contactNumber) {
      return true;
    }
    if (null == contactNumber) {
      return false;
    }
    if (getClass() != contactNumber.getClass()) {
      return false;
    }
    ContactNumber other = (ContactNumber) contactNumber;
    return Objects.equals(id, other.id);
  }

  @Override
  public String toString() {
    return "ContactNumber{"
        + "id="
        + id
        + ", type='"
        + type
        + '\''
        + ", countryCode="
        + countryCode
        + ", number='"
        + number
        + '\''
        + ", isPreferredContact="
        + isPreferredContact
        + '}';
  }
}

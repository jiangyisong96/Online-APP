package onlineapp.service.user.repository.entity;

import onlineapp.service.library.repository.entity.AbstractAddress;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Address Entity.
 *
 * @author WenXiang
 */
@Entity
@Table(name = "address")
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class Address extends AbstractAddress {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column private boolean isPreferredAddress;

  // For @SuppressWarnings("squid:S00107") Lombok @SuperBuilder is in experimental state. This is
  // the only way to use builder for inherited classes atm
  @SuppressWarnings("squid:S00107")
  @Builder
  protected Address(
      String type,
      String blockNumber,
      String unitNumber,
      String floorNumber,
      String buildingName,
      String streetName,
      String postalCode,
      boolean isPreferredAddress) {
    super(type, blockNumber, unitNumber, floorNumber, buildingName, streetName, postalCode);
    this.isPreferredAddress = isPreferredAddress;
  }
}

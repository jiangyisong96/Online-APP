package onlineapp.service.library.repository.entity;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * An abstract for abstract address entity.
 *
 * @author WenXiang
 */
@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public abstract class AbstractAddress extends Auditable {

  @Column(length = 30)
  private String type;

  @Column(length = 10)
  @NotBlank
  private String blockNumber;

  @Column(length = 5)
  private String unitNumber;

  @Column(length = 3)
  private String floorNumber;

  @Column(length = 32)
  private String buildingName;

  @Column(length = 32)
  @NotBlank
  private String streetName;

  @Column(length = 6)
  @NotBlank
  private String postalCode;

  // For @SuppressWarnings("squid:S00107") Lombok @SuperBuilder is in experimental state. This is
  // the only way to use builder for inherited classes atm
  @SuppressWarnings("squid:S00107")
  protected AbstractAddress(
      long createdByUserId,
      long updatedByUserId,
      String type,
      String blockNumber,
      String unitNumber,
      String floorNumber,
      String buildingName,
      String streetName,
      String postalCode) {
    super(createdByUserId, updatedByUserId);
    this.type = type;
    this.blockNumber = blockNumber;
    this.unitNumber = unitNumber;
    this.floorNumber = floorNumber;
    this.buildingName = buildingName;
    this.streetName = streetName;
    this.postalCode = postalCode;
  }
}

package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResitTransactionModel {

  @NotBlank private String internalTransactionRef;

  @JsonIgnore() @Positive private float transactionAmount;
}

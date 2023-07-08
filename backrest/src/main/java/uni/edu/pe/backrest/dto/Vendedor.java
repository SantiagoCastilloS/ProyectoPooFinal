package uni.edu.pe.backrest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Vendedor {
    private int idVendedor;
    private String nombreVendedor;
    private String descripcionVendedor;
    private String direccionVendedor;
    private String telefonoVendedor;
    private String emailVendedor;
    private float valoracionVendedor;
    private int nroVentas;
}

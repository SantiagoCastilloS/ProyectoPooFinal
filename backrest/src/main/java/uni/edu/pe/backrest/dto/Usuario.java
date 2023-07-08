package uni.edu.pe.backrest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {
    private int idUser;
    private String nombreUser;
    private String emailUser;
    private String contraUser;
    private String telefonoUser;
    private String dni;
}

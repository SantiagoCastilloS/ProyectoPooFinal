package uni.edu.pe.backrest.dto;

import lombok.Data;

import java.util.List;
@Data
public class RespuestaProducto {
    private List<Producto> listaProductos;
}

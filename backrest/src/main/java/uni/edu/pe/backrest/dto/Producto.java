package uni.edu.pe.backrest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Producto {
    private int idProducto;
    private String nombreProducto;
    private String descripcionProducto;
    private float precio;
    private Vendedor vendedor;
    private Categoria categoria;
    private String urlImagen;
}

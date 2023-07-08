package uni.edu.pe.backrest.dao;

import uni.edu.pe.backrest.dto.*;

import java.util.List;

public interface AppVentasDao {
    Usuario registrarUsuario(Usuario usuario);

    Pedido registrarPedido(Pedido pedido);

    DetallePedido registrarDetallePedido(DetallePedido detallePedido);

    List<DetalleCompra> getDetalleCompra();

    List<Producto> obtenerProductos();
}

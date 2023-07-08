package uni.edu.pe.backrest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.backrest.dao.AppVentasDao;
import uni.edu.pe.backrest.dto.*;

import java.util.List;
@Transactional
@Service
public class AppVentasServiceImp implements AppVentasService {
    @Autowired
    private AppVentasDao dao;

    @Override
    public Usuario registrarUsuario(Usuario usuario) {
        return dao.registrarUsuario(usuario);
    }

    @Override
    public Pedido registrarPedido(Pedido pedido) {
        return dao.registrarPedido(pedido);
    }

    @Override
    public DetallePedido registrarDetallePedido(DetallePedido detallePedido) {
        return dao.registrarDetallePedido(detallePedido);
    }

    @Override
    public List<DetalleCompra> getDetalleCompra() {
        return dao.getDetalleCompra();
    }

    @Override
    public List<Producto> obtenerProductos() {
        return dao.obtenerProductos();
    }
}


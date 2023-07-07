package uni.edu.pe.backrest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.backrest.dao.TiendaDao;
import uni.edu.pe.backrest.dto.*;

import java.util.List;
@Transactional
@Service
public class TiendaServiceImp implements TiendaService{
    @Autowired
    private TiendaDao dao;

    @Override
    public Cliente registrarUsuario(Cliente cliente) {
        return dao.registrarUsuario(cliente);
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


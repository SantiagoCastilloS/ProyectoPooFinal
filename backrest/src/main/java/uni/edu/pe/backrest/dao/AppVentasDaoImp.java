package uni.edu.pe.backrest.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uni.edu.pe.backrest.dto.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@Repository
public class AppVentasDaoImp implements AppVentasDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private Connection conexion;
    private void obtenerConexion(){
        try {
            conexion = jdbcTemplate.getDataSource().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void cerrarConexion() {
        try {
            conexion.close();
            conexion = null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Usuario registrarUsuario(Usuario usuario) {
        try{
            obtenerConexion();
            String sql = "INSERT INTO cliente VALUES (nextval(secuencia_usuario), ?, ?, ?, ?, ?);";
            PreparedStatement statement = conexion.prepareStatement(sql);
            statement.setString(1, usuario.getNombreUser());
            statement.setString(2, usuario.getEmailUser());
            statement.setString(3, usuario.getContraUser());
            statement.setString(4, usuario.getTelefonoUser());
            statement.setString(5, usuario.getDni());
            statement.executeUpdate();
            statement.close();
            cerrarConexion();
        }catch (SQLException e){
            e.printStackTrace();;
        }
        return usuario;
    }

    @Override
    public Pedido registrarPedido(Pedido pedido) {
        try{
            obtenerConexion();
            String sql = "INSERT INTO pedido VALUES (nextval(secuencia_pedido), ?, ?, ?);";
            PreparedStatement statement = conexion.prepareStatement(sql);
            statement.setInt(1, pedido.getIdCliente());
            statement.setString(2, pedido.getFecha());
            statement.setDouble(3, pedido.getMonto());
            statement.executeUpdate();
            statement.close();
            cerrarConexion();
        }catch (SQLException e){
            e.printStackTrace();;
        }
        return pedido;
    }

    @Override
    public DetallePedido registrarDetallePedido(DetallePedido detallePedido) {
        try{
            obtenerConexion();
            String sql = "INSERT INTO detalle_pedido VALUES (?, ?, ?, ?);";
            PreparedStatement statement = conexion.prepareStatement(sql);
            statement.setInt(1, detallePedido.getIdPedido());
            statement.setInt(2, detallePedido.getIdProducto());
            statement.setDouble(3, detallePedido.getPrecio());
            statement.setInt(4, detallePedido.getCantidad());
            statement.executeUpdate();
            statement.close();
            cerrarConexion();
        }catch (SQLException e){
            e.printStackTrace();;
        }
        return detallePedido;
    }

    @Override
    public List<DetalleCompra> getDetalleCompra() {
        List<DetalleCompra> detalleCompras = new ArrayList<>();
        try{
            obtenerConexion();
            Statement statement = conexion.createStatement();
            String sql = "SELECT cl.nombre, cl.apellPat, cl.apellMat, p.fecha, pr.nombreP, pr.precio, m.nombreM, c.nombreC\n" +
                    "FROM cliente cl\n" +
                    "INNER JOIN pedido p ON (cl.id_cliente = p.id_cliente)\n" +
                    "INNER JOIN detalle_pedido dp ON (p.id_pedido = dp.id_pedido)\n" +
                    "INNER JOIN producto pr ON (dp.id_producto = pr.id_producto)\n" +
                    "INNER JOIN marca m ON (pr.id_marca = m.id_marca)\n" +
                    "INNER JOIN categoria c ON (pr.id_categoria = c.id_categoria);";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()){
                DetalleCompra p = new DetalleCompra(
                        rs.getString("nombre"),
                        rs.getString("apellPat"),
                        rs.getString("apellMat"),
                        rs.getString("fecha"),
                        rs.getString("nombreP"),
                        rs.getDouble("precio"),
                        rs.getString("nombreM"),
                        rs.getString("nombreC")
                );
                detalleCompras.add(p);
            }
            rs.close();
            statement.close();
            cerrarConexion();
        }catch (SQLException e){
            e.printStackTrace();;
        }
        return detalleCompras;
    }

    @Override
    public List<Producto> obtenerProductos() {
        List<Producto> listaProductos = new ArrayList<>();
        try{
            obtenerConexion();
            Statement statement = conexion.createStatement();
            String sql = "SELECT * \n" +
                    "FROM producto pr\n" +
                    "INNER JOIN vendedor v ON (pr.id_ven = v.id_ven)\n" +
                    "INNER JOIN categoria c ON (pr.id_categoria = c.id_categoria)";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()){
                listaProductos.add(extraerProducto(rs));
            }
            rs.close();
            statement.close();
            cerrarConexion();
        }catch (SQLException e){
            e.printStackTrace();;
        }
        return listaProductos;
    }

    private Producto extraerProducto(ResultSet rs) throws SQLException {
        Producto producto = new Producto(
                rs.getInt("id_producto"),
                rs.getString("nombre_producto"),
                rs.getString("descripcion_producto"),
                rs.getFloat("precio"),
                new Vendedor(
                        rs.getInt("id_ven"),
                        rs.getString("nombre_ven"),
                        rs.getString("descripcion_ven"),
                        rs.getString("direccion_ven"),
                        rs.getString("telefono_ven"),
                        rs.getString("email_ven"),
                        rs.getFloat("valoracion_ven"),
                        rs.getInt("nroventas")
                ),
                new Categoria(
                        rs.getInt("id_categoria"),
                        rs.getString("nombreC")
                ),
                rs.getString("urlImage")
        );
        return producto;
    }
}

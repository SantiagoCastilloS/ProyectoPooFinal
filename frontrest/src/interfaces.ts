export interface Producto{
  idProducto:number;
  nombreP: string;
  descripcion: string;
  precio: number;
  vendedor: Vendedor;
  categoria: Categoria;
  urlImagen: string;
}
export interface RespuestaProducto{
  listaProductos: Producto[];
}

export interface Vendedor{
  idVendedor: number;
  nombreVendedor: string;
  descripcionVendedor: string;
  direccionVendedor: string;
  telefonoVendedor: string;
  emailVendedor: string;
  valoracionVendedor: number;
  nroVentas: number;
}
export interface Categoria{
  idCategoria: number;
  nombreC: string;
}

export interface Cliente{
  nombre: string;
  email: string;
  contra: string;
  telefono: string;
  dni: string;
}

export interface Compra{
  idCliente: number;
  idPedido: number;
  idProducto: number;
  precio: number;
  cantidad: number;
  monto: number;
}

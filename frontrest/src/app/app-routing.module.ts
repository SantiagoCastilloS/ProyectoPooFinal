import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {ProductoComponent} from "./PRODUCTO/producto.component";
import {LoginComponent} from "./LOGEO/login.component";
import {DetalleproductoComponent} from "./PRODUCTODETALLADO/detalleproducto.component";
import {RegistroComponent} from "./REGISTRAR/registro.component";

const routes: Routes = [
  {path: "producto", component: ProductoComponent},
  {path: "login", component: LoginComponent},
  {path: "detalleproducto/:id", component: DetalleproductoComponent},
  {path: "registro", component: RegistroComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

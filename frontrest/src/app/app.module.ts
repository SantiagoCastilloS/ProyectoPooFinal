import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DetalleproductoComponent } from './PRODUCTODETALLADO/detalleproducto.component';
import { LoginComponent } from './LOGEO/login.component';
import { ProductoComponent } from './PRODUCTO/producto.component';
import { RegistroComponent } from './REGISTRAR/registro.component';
import {HttpClientModule} from "@angular/common/http";
import {FormsModule} from "@angular/forms";
import {CommonModule} from "@angular/common";

@NgModule({
  declarations: [
    AppComponent,
    DetalleproductoComponent,
    LoginComponent,
    ProductoComponent,
    RegistroComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    CommonModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

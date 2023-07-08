import {Component, OnInit} from '@angular/core';
import {ApiService} from "../../ApiService";
import {Cliente} from "../../interfaces";

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.scss']
})
export class RegistroComponent implements OnInit{
  nombre: string = "";
  email: string = "";
  contra: string = "";
  telefono: string = "";
  dni: string = "";

  constructor(private api: ApiService) {
  }
  ngOnInit() {
  }

  registrar() {
    console.log(this.nombre);
    console.log(this.email);
    console.log(this.contra);
    console.log(this.telefono);
    console.log(this.dni);

    const cliente: Cliente ={
      nombre: this.nombre,
      email: this.email,
      contra: this.contra,
      telefono: this.telefono,
      dni: this.dni
    }

    this.api.registrarUsuario(cliente).subscribe(data =>{
      console.log("<=== respuesta del metodo registrar usuario ===>");
      console.log(data.nombre);
    })
  }
}

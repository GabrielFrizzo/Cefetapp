import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-biblioteca',
  templateUrl: './biblioteca.page.html',
  styleUrls: ['./biblioteca.page.scss'],
})
export class BibliotecaPage implements OnInit {

  public books = [
    { title: 'A volta dos que não foram', author: 'Aluísio de Azevedo', renewals: 2 },
    { title: 'Percy Jackson', author: 'Karl Marx', renewals: 1 },
    { title: 'Física 7', author: 'Rafael Barreto', renewals: 3 },
    { title: 'Matemática Introdutória', author: 'Desconhecido', renewals: 3 },
    { title: 'Ionic Para Iniciantes', author: 'Mateus Freitas', renewals: 0 },
  ];

  constructor() { }

  ngOnInit() {
  }

}

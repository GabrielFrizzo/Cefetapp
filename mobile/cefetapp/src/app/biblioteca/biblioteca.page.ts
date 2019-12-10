import { Component, OnInit } from '@angular/core';
import { ApiDjangoService } from '../services/api-django.service';

@Component({
  selector: 'app-biblioteca',
  templateUrl: './biblioteca.page.html',
  styleUrls: ['./biblioteca.page.scss'],
})
export class BibliotecaPage implements OnInit {

  books: any

  constructor(private service: ApiDjangoService) { }

  ngOnInit() {
  }

  ionViewDidEnter() {
    this.books = [];
    this.get_biblioteca();
  }

  get_biblioteca() {
    this.service.get_biblioteca()
      .then((result: any) => {
        this.books = result;
        console.log(this.books)
      });
  }

}

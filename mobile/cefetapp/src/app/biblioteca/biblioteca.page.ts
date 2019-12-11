import { Component, OnInit } from '@angular/core';
import { ApiDjangoService } from '../services/api-django.service';
import { Livro } from './livro';

@Component({
  selector: 'app-biblioteca',
  templateUrl: './biblioteca.page.html',
  styleUrls: ['./biblioteca.page.scss'],
})
export class BibliotecaPage implements OnInit {

  books: any
  querry: any

  constructor(private service: ApiDjangoService) { }

  ngOnInit() {
  }

  ionViewDidEnter() {
    this.books = [];
    this.querry = [];
    this.get_biblioteca();
  }

  get_biblioteca() {
    this.service.get_biblioteca()
      .then((result: [Livro]) => {
        this.books = result;
      });
  }

  renew_book(book: Livro) {
    this.service.renew_book(book.id)
      .then((result: any) => {
        console.log('renovou!');
      });
  }

  search_book(event) {
    this.service.search_book(event.srcElement.value)
      .then((result: [Livro]) => {
        this.querry = result;
      });
  }

}

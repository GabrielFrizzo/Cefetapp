import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-historico',
  templateUrl: './historico.page.html',
  styleUrls: ['./historico.page.scss'],
})
export class HistoricoPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  public record = [
    {term: 1, code: 'CSF13', name: 'Fundamentos De Programação 1', class: 'S71', grade: 9.6, freq: 97.4},
    {term: 2, code: 'CSE20', name: 'Técnicas De Programação', class: 'S71', grade: 7.3, freq: 97.1}
  ]

}

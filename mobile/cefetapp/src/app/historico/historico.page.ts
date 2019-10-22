import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-historico',
  templateUrl: './historico.page.html',
  styleUrls: ['./historico.page.scss'],
})
export class HistoricoPage implements OnInit {
  public record = [
    {term: 1, code: 'CSF13', name: 'Fundamentos De Programação 1', class: 'S71', grade: 9.6, freq: 97.4},
    {term: 2, code: 'CSE20', name: 'Técnicas De Programação', class: 'S71', grade: 5.2, freq: 67.1},
    {term: 9, code: 'CSA38', name: 'Protelação de Entregas 3', class: 'S71', grade: 6.8, freq: 94.1},
    {term: 6, code: 'CSR21', name: 'Trancamento de Curso 2', class: 'S71', grade: 7.3, freq: 92.1},
    {term: 8, code: 'BQE44', name: 'Frequência 0', class: 'S19', grade: 10, freq: 0},
  ];

  constructor() { }

  ngOnInit() {
  }
}

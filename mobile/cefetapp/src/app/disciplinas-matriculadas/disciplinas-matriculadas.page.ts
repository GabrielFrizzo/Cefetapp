import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-disciplinas-matriculadas',
  templateUrl: './disciplinas-matriculadas.page.html',
  styleUrls: ['./disciplinas-matriculadas.page.scss'],
})
export class DisciplinasMatriculadasPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  public subjects = [
    { code: 'CSG20', name: 'Análise E Projeto De Sistemas', room: 'B-107', class: 'S71'}
  ]

}

import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-disciplinas-matriculadas',
  templateUrl: './disciplinas-matriculadas.page.html',
  styleUrls: ['./disciplinas-matriculadas.page.scss'],
})
export class DisciplinasMatriculadasPage implements OnInit {
  public subjects = [
    { code: 'CSG20', name: 'Análise E Projeto De Sistemas', room: 'B-107', class: 'S71',
      times: [{day: 'seg', start: '13:50', end: '15:30'},
              {day: 'qui', start: '10:20', end: '12:50'},
             ]},
    { code: 'ECG47', name: 'Projeto e Sistemas De Análise', room: 'Q-301', class: 'S11',
      times: [{day: 'qua', start: '15:50', end: '19:30'}]},
    { code: 'CSG20', name: 'Sistema de Projetos e Análises', room: 'E-209', class: 'S73',
      times: [{day: 'sex', start: '09:10', end: '12:00'}]},
  ];

  constructor() { }

  ngOnInit() {
  }

}

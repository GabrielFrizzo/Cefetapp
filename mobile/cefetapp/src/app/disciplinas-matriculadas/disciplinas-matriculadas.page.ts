import { Component, OnInit } from '@angular/core';
import { ApiDjangoService } from '../services/api-django.service';

@Component({
  selector: 'app-disciplinas-matriculadas',
  templateUrl: './disciplinas-matriculadas.page.html',
  styleUrls: ['./disciplinas-matriculadas.page.scss'],
})
export class DisciplinasMatriculadasPage implements OnInit {
  subjects: any

  constructor(private service: ApiDjangoService) { }

  ngOnInit() {
  }

  ionViewDidEnter() {
    this.subjects = [];
    this.get_disciplinas_matriculadas();
  }

  get_disciplinas_matriculadas() {
    this.service.get_disciplinas_matriculadas()
      .then((result: any) => {
        result.forEach(element => {
          this.subjects.push({name: element.grade.subject.name, class_times: JSON.parse(element.grade.subject.class_times)})
        });
        console.log(this.subjects)
      });
  }

}

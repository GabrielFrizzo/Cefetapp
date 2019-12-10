import { Component, OnInit } from '@angular/core';
import { ApiDjangoService } from '../services/api-django.service';

@Component({
  selector: 'app-historico',
  templateUrl: './historico.page.html',
  styleUrls: ['./historico.page.scss'],
})
export class HistoricoPage implements OnInit {
  record: any

  constructor(private service: ApiDjangoService) { }

  ngOnInit() {
  }

  ionViewDidEnter() {
    this.record = [];
    this.get_historico();
  }

  get_historico() {
    this.service.get_historico()
      .then((result: any) => {
        result.forEach(element => {              
          this.record.push({name: element.grade.subject, grade: element.grade.grade, semester:element.semester})
        });   
      });
  }
}

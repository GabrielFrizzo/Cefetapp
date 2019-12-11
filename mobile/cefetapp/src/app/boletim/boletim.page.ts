import { Component, OnInit } from '@angular/core';
import { Boletim } from './boletim';
import { ApiDjangoService } from '../services/api-django.service';

@Component({
  selector: 'app-boletim',
  templateUrl: './boletim.page.html',
  styleUrls: ['./boletim.page.scss'],
})
export class BoletimPage implements OnInit {
  report_card: any;

  constructor(private service: ApiDjangoService) { }

  ngOnInit() {
  }

  ionViewDidEnter() {
    this.report_card = [];
    this.get_boletim();
  }

  get_boletim() {
    this.service.get_boletim()
      .then((result: any) => {
        result.forEach(element => {
          this.report_card.push({subject: element.subject.name, grade: element.grade})
        });
      });
  }
}

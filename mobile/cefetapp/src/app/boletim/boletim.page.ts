import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-boletim',
  templateUrl: './boletim.page.html',
  styleUrls: ['./boletim.page.scss'],
})
export class BoletimPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  public report_card = [
    { name: 'CSG20-S71', freq: 90.3 , grade: 0}
  ]
}

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { DisciplinasMatriculadasPage } from './disciplinas-matriculadas.page';

const routes: Routes = [
  {
    path: '',
    component: DisciplinasMatriculadasPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [DisciplinasMatriculadasPage]
})
export class DisciplinasMatriculadasPageModule {}

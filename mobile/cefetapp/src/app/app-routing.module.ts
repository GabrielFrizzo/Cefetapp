import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then(m => m.HomePageModule)
  },
  {
    path: 'list',
    loadChildren: () => import('./list/list.module').then(m => m.ListPageModule)
  },
  {
    path: 'boletim', 
    loadChildren: './boletim/boletim.module#BoletimPageModule' 
  },
  {
    path: 'biblioteca', 
    loadChildren: './biblioteca/biblioteca.module#BibliotecaPageModule' 
  },
  {
    path: 'historico', 
    loadChildren: './historico/historico.module#HistoricoPageModule' 
  },
  {
    path: 'disciplinas-matriculadas', 
    loadChildren: './disciplinas-matriculadas/disciplinas-matriculadas.module#DisciplinasMatriculadasPageModule' 
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}

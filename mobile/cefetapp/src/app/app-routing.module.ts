import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { LoginPage } from './login/login.page';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full'
  },
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then(m => m.HomePageModule)
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
  },
  {
    path: 'login',
    loadChildren: () => import('./login/login.module').then(m => m.LoginPageModule)
  },
  {
    path: 'logout',
    loadChildren: () => import('./login/login.module').then(m => m.LoginPageModule)
  },
  {
    path: 'settings',
    loadChildren: './settings/settings.module#SettingsPageModule'
  }


];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}

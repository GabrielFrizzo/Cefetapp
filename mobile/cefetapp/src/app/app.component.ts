import { Component } from '@angular/core';

import { Platform } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { ApiDjangoService } from './services/api-django.service';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss']
})
export class AppComponent {
  public appPages = [
    {
      title: 'Grade Horária',
      url: '/home',
      icon: 'calendar'
    },
    {
      title: 'Boletim',
      url: '/boletim',
      icon: 'list'
    },
    {
      title: 'Biblioteca',
      url: '/biblioteca',
      icon: 'bookmarks'
    },
    {
      title: 'Disciplinas Matriculadas',
      url: '/disciplinas-matriculadas',
      icon: 'flask'
    },
    {
      title: 'Histórico',
      url: '/historico',
      icon: 'school'
    },
  ];

  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar,
    private authService: ApiDjangoService,
  ) {
    this.initializeApp();
  }

  logout() {
    console.log('deslogando');
    this.authService.logout();
    console.log('deslogado');
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
    });
  }
}

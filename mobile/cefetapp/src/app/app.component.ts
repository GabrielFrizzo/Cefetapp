import { Component } from '@angular/core';

import { Platform } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

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
      icon: 'home'
    },
    {
      title: 'Boletim',
      url: '/boletim',
      icon: 'list'
    },
    {
      title: 'Biblioteca',
      url: '/biblioteca',
      icon: 'paper-plane'
    },
    {
      title: 'Disciplinas Matriculadas',
      url: '/disciplinas-matriculadas',
      icon: 'flask'
    },
    {
      title: 'Histórico',
      url: '/historico',
      icon: 'beer'
    },
  ];

  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar
  ) {
    this.initializeApp();
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
    });
  }
}

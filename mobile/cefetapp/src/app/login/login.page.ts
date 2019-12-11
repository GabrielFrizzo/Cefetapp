import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastController } from '@ionic/angular';
import { ApiDjangoService } from '../services/api-django.service';
import {  MenuController } from '@ionic/angular';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  constructor(private router: Router,
              public toastController: ToastController,
              private authService: ApiDjangoService,
              private menuController: MenuController) { }

  ngOnInit() {
  }

  ionViewWillEnter() {
    this.menuController.enable(false);
  }
  
  ionViewWillLeave() {
    this.menuController.enable(true);
  }

  login(form){
    console.log('logando');
    this.authService.login(form.value).subscribe((res: AuthResponse) => {
      this.router.navigateByUrl('home');
    }, (err) => {
      this.presentToast('Dados não cadastrados. Selecione a opção Cadastrar-se');
    })
  }

  logout() {
    console.log('deslogando');
    this.authService.logout();
  }

  signup(form){
    //this.authService.register(form.value).subscribe((res) => {
    //   this.router.navigateByUrl('home');
    //});
    if (form.value.ra === "1" && form.value.password === "password") {//password handling top
      this.router.navigateByUrl('home');
    } else {
      this.presentToast('Usuário não cadastrado no Portal do Aluno');
    }
  }

  async presentToast(message) {
    const toast = await this.toastController.create({
      message,
      duration: 2000
    });
    toast.present();
  }
}

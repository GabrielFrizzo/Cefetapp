import { Component, OnInit } from '@angular/core';
import { Router } from  "@angular/router";
import { ToastController } from '@ionic/angular';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  constructor(private  router:  Router, public toastController: ToastController) { }

  ngOnInit() {
  }

  login(form){
    //this.authService.login(form.value).subscribe((res)=>{
    //  this.router.navigateByUrl('home');
    //});
    if (form.value.ra === "0" && form.value.password === "password") {//password handling top
      this.router.navigateByUrl('home');
    } else {
      this.presentToast('Dados não cadastrados. Selecione a opção Cadastrar-se');
    }    
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
      message: message,
      duration: 2000
    });
    toast.present();
  }
}

import { Component, OnInit } from '@angular/core';
import { ApiDjangoService } from '../services/api-django.service';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.page.html',
  styleUrls: ['./settings.page.scss'],
})
export class SettingsPage implements OnInit {

  settings = []
  notification: any
  
  constructor(private service: ApiDjangoService) { }

  ngOnInit() {
  }

  ionViewDidEnter() {
    this.settings = [];
    this.get_user_config();
  }

  get_user_config() {
    this.service.get_user_config()
      .then((result: any) => {
        result.forEach(element => {
          this.settings.push({id: element.id, name: element.config_name, value: element.config_value})
        }); 
        const found = this.settings.find(e => e.name === "Notification");
        if (found) {
          this.notification = found.value
          console.log(this.notification)
        }             
      });
  }

  update_config(id, configName, configValue) {
    this.service.update_config(id, configName, configValue)
      .then((result: any) => {
        console.log('atualizado');
      });
  }

  notificationChange(event) {
    const found = this.settings.find(e => e.name === "Notification");
    if (found) {
      found.value = event.detail.value
      this.update_config(found.id, found.name, found.value)
    } 
  }
}


import { Component, Pipe, PipeTransform } from '@angular/core';
import { ApiDjangoService } from '../services/api-django.service';

enum Slot {
  M1, M2, M3, M4, M5, M6,
  T1, T2, T3, T4, T5, T6,
  N1, N2, N3, N4, N5
}

enum WeekDay {
  Seg = 1,
  Ter = 2,
  Qua = 3,
  Qui = 4,
  Sex = 5,
  Sáb = 6
}

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(private service: ApiDjangoService) {}

  schedule = []

  slots = Slot;
  weekdays = WeekDay;

  ionViewDidEnter() {
    this.schedule = [];
    this.get_disciplinas_matriculadas();
  }

  get_disciplinas_matriculadas() {
    this.service.get_disciplinas_matriculadas()
      .then((result: any) => {
        var subjects = result;
        subjects.forEach(element => {
          element.grade.subject.class_times = JSON.parse(element.grade.subject.class_times)
          element.grade.subject.class_times.forEach(class_time => {
            this.schedule.push({name: element.grade.subject.name, day: this.stringToWeekday(class_time.day), slot: this.timeToSlot(class_time.start)})            
          });
        });
        
      });
  }

  weekdayToString(day: WeekDay): string {
    switch (day) {
      case WeekDay.Seg:
        return 'Seg';
      case WeekDay.Ter:
        return 'Ter';
      case WeekDay.Qua:
        return 'Qua';
      case WeekDay.Qui:
        return 'Qui';
      case WeekDay.Sex:
        return 'Sex';
      case WeekDay.Sáb:
        return 'Sáb';
      default:
        return '';
    }
  }

  stringToWeekday(day: string): WeekDay {
    switch (day) {
      case 'Seg':
        return WeekDay.Seg;
      case 'Ter':
        return WeekDay.Ter;
      case 'Qua':
        return WeekDay.Qua;
      case 'Qui':
        return WeekDay.Qui;
      case 'Sex':
        return WeekDay.Sex;
      case 'Sáb':
        return WeekDay.Sáb;
      default:
        return null;
    }
  }

  slotToString(slot: Slot): string {
    if (slot < Slot.T1) {
      return 'M' + (slot + 1);
    } else if (slot < Slot.N1) {
      return 'T' + (slot - 5);
    }
    return 'N' + (slot - 11);
  }

  timeToSlot(time: string): Slot {
    switch (time) {
      case '7:30':
        return Slot.M1;
      case '8:20':
        return Slot.M2;
      case '9:10':
        return Slot.M3;
      case '10:20':
        return Slot.M4;
      case '11:10':
        return Slot.M5;
      case '12:00':
        return Slot.M6;
      case '13:00':
        return Slot.T1;
      case '13:50':
        return Slot.T2;
      case '14:40':
        return Slot.T3;
      case '15:50':
        return Slot.T4;
      case '16:40':
        return Slot.T5;
      case '17:50':
        return Slot.T6;
      case '18:40':
        return Slot.N1;
      case '19:30':
        return Slot.N2;
      case '20:20':
        return Slot.N3;
      case '21:20':
        return Slot.N4;
      case '22:10':
        return Slot.N5;
      default:
        return null;
    }
  }

  scheduleContains(day: any, slot: any): object {
    const found = this.schedule.find(e => this.slotToString(e.slot) === slot && this.weekdayToString(e.day) === day);
    if (found) {
      return found;
    }
    return null;
  }
}

@Pipe({
  name: 'enumToArray'
})
export class EnumToArrayPipe implements PipeTransform {
  transform(data: object) {
    const keys = Object.keys(data);
    return keys.slice(keys.length / 2);
  }
}

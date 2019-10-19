import { Component, Pipe, PipeTransform } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor() {}

  public schedule = [
    { name: 'CSG20-S71', room: 'B-107',day : WeekDay.Qua, slot: Slot.M3 },
    { name: 'CSG20-S71', room: 'B-107',day : WeekDay.Qua, slot: Slot.M4 },
    { name: 'CSG20-S71', room: 'B-107',day : WeekDay.Qua, slot: Slot.M5 }
  ]

  slots = Slot
  weekdays = WeekDay

  weekdayToString(day: WeekDay):string {
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

  slotToString(slot: Slot):string {
    if (slot < Slot.T1) {
      return 'M' + (slot + 1);
    } else if (slot < Slot.N1) {
      return 'T' + (slot - 5);
    }
    return 'N' + (slot - 11);
  }

  scheduleContains(day:any, slot:any):string {
    let found = this.schedule.find(e => this.slotToString(e.slot) === slot && this.weekdayToString(e.day) === day)
    if (found) {
      return found.name;
    }
    return '';
  }
}

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

@Pipe({
  name: 'enumToArray'
})
export class EnumToArrayPipe implements PipeTransform {
  transform(data: Object) {
    const keys = Object.keys(data);
    return keys.slice(keys.length / 2);
  }
}
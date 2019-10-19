import { Component } from '@angular/core';
import {WeekDay} from '@angular/common';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor() {}

  public schedule = [
    { name: 'CSG20-S71', room: 'B-107',day : WeekDay.Wednesday, slot: Slot.M3 },
    { name: 'CSG20-S71', room: 'B-107',day : WeekDay.Wednesday, slot: Slot.M4 },
    { name: 'CSG20-S71', room: 'B-107',day : WeekDay.Wednesday, slot: Slot.M5 }
  ]

  weekdayToString(day: WeekDay):string {
    switch (day) {
      case WeekDay.Sunday:
        return 'Dom';
  
      case WeekDay.Monday:
        return 'Seg';
      
      case WeekDay.Tuesday:
        return 'Ter';
  
      case WeekDay.Wednesday:
        return 'Qua';
        
      case WeekDay.Thursday:
        return 'Qui';
    
      case WeekDay.Friday:
        return 'Sex';
      
      case WeekDay.Saturday:
        return 'Sat';
  
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
}

enum Slot {
  M1, M2, M3, M4, M5, M6,
  T1, T2, T3, T4, T5, T6,
  N1, N2, N3, N4, N5
}


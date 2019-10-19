import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DisciplinasMatriculadasPage } from './disciplinas-matriculadas.page';

describe('DisciplinasMatriculadasPage', () => {
  let component: DisciplinasMatriculadasPage;
  let fixture: ComponentFixture<DisciplinasMatriculadasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DisciplinasMatriculadasPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DisciplinasMatriculadasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

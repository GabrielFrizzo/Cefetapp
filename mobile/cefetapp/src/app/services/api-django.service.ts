import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { tap } from 'rxjs/operators';
import { Observable, BehaviorSubject } from 'rxjs';

import { Storage } from '@ionic/storage';
import { User } from '../login/user';
import { AuthResponse } from '../login/auth-response';

@Injectable({
  providedIn: 'root'
})
export class ApiDjangoService {
  SERVER_ADRESS = 'http://127.0.0.1:8000';
  authSubject = new BehaviorSubject(false);
  url = '/api/v1/';
  constructor(private http: HttpClient, private storage: Storage) { }

  login(user: User): Observable<AuthResponse> {
    return this.http.post(`${this.SERVER_ADRESS}/rest-auth/login/`, user).pipe(
      tap(async (res: AuthResponse ) => {
        console.log(res);
        console.log(res.key);
        await this.storage.set('ACCESS_TOKEN', res.key);

        this.authSubject.next(true);
      }
      )
    );
  }

  async logout() {
    await this.storage.remove('ACCESS_TOKEN');
    this.authSubject.next(false);
  }

  isLoggedIn() {
    return this.authSubject.asObservable();
  }

  get_boletim() {
    return new Promise((resolve, reject) => {
      this.storage.get('ACCESS_TOKEN').then((token) => {
        this.http.get(`${this.SERVER_ADRESS}${this.url}grades`,
                         { headers: {
                            Authorization: `Token ${token}`
                           }
                         }).subscribe((result: any) => {
                           console.log('sem erro');
                           resolve(result);
                         },
                         (error) => {
                           console.log(error);
                           reject(error.json);
                         });
      });
    });
  }

  get_disciplinas_matriculadas() {
    return new Promise((resolve, reject) => {
      this.storage.get('ACCESS_TOKEN').then((token) => {
        this.http.get(`${this.SERVER_ADRESS}${this.url}subjects`,
                         { headers: {
                            Authorization: `Token ${token}`
                           }
                         }).subscribe((result: any) => {
                           console.log('sem erro');
                           resolve(result);
                         },
                         (error) => {
                           console.log(error);
                           reject(error.json);
                         });
      });
    });
  }

  get_biblioteca() {
    return new Promise((resolve, reject) => {
      this.storage.get('ACCESS_TOKEN').then((token) => {
        this.http.get(`${this.SERVER_ADRESS}${this.url}books`,
                         { headers: {
                            Authorization: `Token ${token}`
                           }
                         }).subscribe((result: any) => {
                           console.log('sem erro');
                           resolve(result);
                         },
                         (error) => {
                           console.log(error);
                           reject(error.json);
                         });
      });
    });
  }

  get_historico() {
    return new Promise((resolve, reject) => {
      this.storage.get('ACCESS_TOKEN').then((token) => {
        this.http.get(`${this.SERVER_ADRESS}${this.url}grade_history`,
                         { headers: {
                            Authorization: `Token ${token}`
                           }
                         }).subscribe((result: any) => {
                           console.log('sem erro');
                           resolve(result);
                         },
                         (error) => {
                           console.log(error);
                           reject(error.json);
                         });
      });
    });
  }
}




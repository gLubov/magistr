import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(
       ),
    );
  }
}       
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';
  bool _authenticated = false;

  void _login() {
    // Здесь можно реализовать проверку логина и пароля.
    if (_username == 'username' && _password == 'password') {
      setState(() {
        _authenticated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_authenticated) {
      return WelcomeScreen();
    } else {
      return Scaffold( backgroundColor: Color.fromARGB(255, 19, 108, 180),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
               Padding(
                    padding: const EdgeInsets.only(right: 0.0,bottom: 100.0),
                    child: Image.asset('asset/head-logo.jpg', /*width: 40, height: 40*/),
                  ),
                SizedBox(height: 20),
                Text(
                'Единое окно аутентификации и авторизации корпоративной информационной системы',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[                                   
                  Container(
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Войдите с помощью учетных данных',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white), 
                  ),
                        TextFormField(                  
                          decoration: InputDecoration(                            
                            labelText: 'Логин',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                           onChanged: (value) {
                            _username = value;
                            },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Пароль',
                            fillColor: Colors.white,
                            filled: true,
                          ), onChanged: (value) {
                              _password = value;
                            },
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                           onPressed: _login,
                          child: Text('Вход'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(                    
                    children: <Widget>[                        
                      Text(
                        'Или воспользуйтесь внешней информационной системой',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                      child: Row(
                        children: <Widget>[
                        IconButton(
                        icon: Image.asset('asset/vk.png',
                        width: 60.0,
                        height: 60.0),
                        onPressed: () {
                          // код для авторизации через Вконтакте
                        },                        
                      ),
                      IconButton(
                        icon: Image.asset('asset/ok.png',
                        width: 60.0,
                        height: 60.0),
                        onPressed: () {
                          // код для авторизации через Одноклассники
                        },
                      ),
                       IconButton(
                        icon: Image.asset('asset/ya.png',
                        width: 70.0,
                        height: 70.0),
                        onPressed: () {
                          // код для авторизации через Яндекс
                        },
                      ),
                       IconButton(
                        icon: Image.asset('asset/esia.png',
                        width: 70.0,
                        height: 70.0),
                        onPressed: () {
                          // код для авторизации через ЕСИА
                        },
                        ), 
                      ],   
                      ),
                      ),                                        
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome!', style: TextStyle(fontSize: 24)),
            // Здесь НУЖНО добавить анимацию
          ],
        ),
      ),
    );
  }
}
         
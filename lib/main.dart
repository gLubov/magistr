import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_application_test/server.dart';



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

  Future<void> authenticateUser(String login, String password) async {
    String url = 'http://localhost:8080/';

    Map<String, String> requestBody = {
      'login': login,
      'password': password,
    };

    var response = await http.post(Uri.parse(url), body: requestBody);

    if (response.statusCode == 200) {
      setState(() {
        _authenticated = true;
      });
    } else {
      _authenticated = false;
      // Обработка ошибки аутентификации
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
                const Text(
                'Единое окно аутентификации и авторизации корпоративной информационной системы',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[                                   
                  Container(
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Войдите с помощью учетных данных',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white), 
                  ),
                        TextFormField(                  
                          decoration: const InputDecoration(                            
                            labelText: 'Логин',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                           onChanged: (value) {
                            _username = value;
                            },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Пароль',
                            fillColor: Colors.white,
                            filled: true,
                          ), onChanged: (value) {
                              _password = value;
                            },
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                           onPressed: () {
                              authenticateUser(_username,_password);
                           },
                          child: const Text('Вход'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(                    
                    children: <Widget>[                        
                      const Text(
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
      appBar: AppBar(title:const Text('Welcome')),
      body: const Center(
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
         
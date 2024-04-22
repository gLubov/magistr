import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_test/server.dart';



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

  Future<void> postData() async {
  Uri url = Uri.parse('http://localhost:8080/');
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': 'localhost', // Добавляем заголовок CORS
  };

  Map<String, dynamic> data = {
    'login': 'user',
    'password': 'password',
  };

  try {
    var response = await http.post(
      url as Uri,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
Future<void> showTemporaryDialog() async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Данная функция временно недоступна'),
      );
    }
  );
  
  await Future.delayed(Duration(seconds: 2)); // Задержка в 2 секунды
  Navigator.of(context).pop(); // Закрытие диалогового окна
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
                              postData();
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
                          showTemporaryDialog();
                        },                        
                      ),
                      IconButton(
                        icon: Image.asset('asset/ok.png',
                        width: 60.0,
                        height: 60.0),
                        onPressed: () {
                          showTemporaryDialog();
                        },
                      ),
                       IconButton(
                        icon: Image.asset('asset/ya.png',
                        width: 70.0,
                        height: 70.0),
                        onPressed: () {
                          showTemporaryDialog();
                        },
                      ),
                       IconButton(
                        icon: Image.asset('asset/esia.png',
                        width: 70.0,
                        height: 70.0),
                        onPressed: () {
                          showTemporaryDialog();
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
         
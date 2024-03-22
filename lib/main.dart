import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 19, 108, 180),
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
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Пароль',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          
                          onPressed: () {
                            // Ваш код для обработки входа
                          },
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
                          // Ваш код для авторизации через Вконтакте
                        },                        
                      ),
                      IconButton(
                        icon: Image.asset('asset/ok.png',
                        width: 60.0,
                        height: 60.0),
                        onPressed: () {
                          // Ваш код для авторизации через Одноклассники
                        },
                      ),
                       IconButton(
                        icon: Image.asset('asset/ya.png',
                        width: 70.0,
                        height: 70.0),
                        onPressed: () {
                          // Ваш код для авторизации через Яндекс
                        },
                      ),
                       IconButton(
                        icon: Image.asset('asset/esia.png',
                        width: 70.0,
                        height: 70.0),
                        onPressed: () {
                          // Ваш код для авторизации через ЕСИА
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
      ),
    );
  }
}       

         
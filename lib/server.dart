import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:logging/logging.dart';

void main() async {
  var app = Router();
  hierarchicalLoggingEnabled = true;
  final Logger _logger = Logger('MyApp');
  _logger.level = Level.ALL;

  // Middleware для CORS
  app.all('/<ignored|.*>', (Request request) {
    if (request.method == 'OPTIONS') {
      return Response.ok(null, headers: {
        'Access-Control-Allow-Origin': 'localhost', // Замените* на ваш домен при развертывании
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept',
        'Access-Control-Max-Age': '86400',
        
        'Cache-Control': 'no-cache',
      });
    }
    return null;
  });

  app.post('/', (Request request) async {
    try {
      _logger.info('Received POST request for /');
      Map<String, dynamic> requestBody = jsonDecode(await request.readAsString());
      String username = requestBody['login'];
      String password = requestBody['password'];

      // Здесь можно добавить логику аутентификации с базой данных или другой системой

      if (username == 'user' && password == 'password') {
        return Response.ok('Authenticated');
      } else {
        return Response.forbidden('Authentication failed');
      }
    } catch (e) {
      return Response.internalServerError(body: 'Error: $e', headers: {'Access-Control-Allow-Origin': 'localhost'});
    };
    });

  var handler = const Pipeline().addMiddleware(logRequests()).addHandler(app.call);

  var server = await shelf_io.serve(handler, 'localhost', 8080);
  _logger.info('Server running on localhost:${server.port}');
}
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  static Future<void> loadEnvironment() async =>
      await dotenv.load(fileName: '.env');

  static final String apiUrl =
      dotenv.env['API_URL'] ?? 'NO HA CONFIGURADO EL API URL';
}

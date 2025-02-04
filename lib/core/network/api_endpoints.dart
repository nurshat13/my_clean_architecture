import 'package:flutter/material.dart';
import 'package:my_clean_architecture/core/constants/environment_config.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// [baseUrl] should be used everywhere
  /// [_baseUrlProd] for production mode and
  /// [_baseUrlDev] for developement mode
  static String baseUrl = EnvironmentConfig.isProduction ? _baseUrlProd : _baseUrlDev;

  static const String _baseUrlProd = 'https://jsonplaceholder.org';
  static const String _baseUrlDev = 'https://jsonplaceholder.org';
}

enum AuthEndpoint {
  register('baseUrl'),
  login('baseUrl'),
  deleteAccount('');

  const AuthEndpoint(this.path);

  final String path;
}

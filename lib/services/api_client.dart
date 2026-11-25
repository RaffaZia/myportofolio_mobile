import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/experience.dart';

/// Exception thrown when an API request returns a non-2xx status code.
class ApiException implements Exception {
  const ApiException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() => 'ApiException($statusCode): $message';
}

/// HTTP client for the MyPortfolio Django REST Framework backend.
class ApiClient {
  ApiClient({http.Client? client, this.baseUrl = apiBaseUrl})
    : _client = client ?? http.Client();

  final http.Client _client;
  final String baseUrl;

  Uri _uri(String path) => Uri.parse('$baseUrl$path');

  /// Get all experiences from Django.
  Future<List<Experience>> getExperiences() async {
    final response = await _client.get(
      _uri('/api/v1/experience/'),
      headers: const {'Accept': 'application/json'},
    );

    _ensureSuccess(response);

    final decoded = jsonDecode(response.body) as List<dynamic>;

    return decoded
        .map((item) => Experience.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Create a new experience.
  Future<Experience> createExperience({
    required String title,
    required String description,
    required String category,
    String? thumbnail,
    required String token,
  }) async {
    final response = await _client.post(
      _uri('/api/v1/experience/'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: jsonEncode({
        'title': title,
        'description': description,
        'category': category,
        'thumbnail': thumbnail == null || thumbnail.isEmpty ? null : thumbnail,
      }),
    );

    _ensureSuccess(response);

    return Experience.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Obtain authentication token.
  Future<String> obtainToken(String username, String password) async {
    final response = await _client.post(
      _uri('/api/v1/auth/token/'),
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );

    _ensureSuccess(response);

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return decoded['token'] as String;
  }

  /// Logout and revoke the current token.
  Future<void> logout({required String token}) async {
    final response = await _client.post(
      _uri('/api/v1/auth/logout/'),
      headers: {'Accept': 'application/json', 'Authorization': 'Token $token'},
    );

    _ensureSuccess(response);
  }

  /// Ensure that the response status code is successful.
  void _ensureSuccess(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return;
    }

    throw ApiException(response.statusCode, response.body);
  }

  void dispose() {
    _client.close();
  }
}

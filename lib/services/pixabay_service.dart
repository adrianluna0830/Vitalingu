import 'dart:convert';
import 'package:http/http.dart' as http;

class PixabayService {
  PixabayService();

  final String _baseUrl = 'https://pixabay.com/api/';
  late final String apiKey;

  Future<Map<String, dynamic>> searchImages({
    String? q,
    String? imageType,
    String? orientation,
    String? category,
  }) async {
    final uri = _buildUri(
      baseUrl: _baseUrl,
      queryParameters: {
        'key': apiKey,
        if (q != null) 'q': q,
        if (imageType != null) 'image_type': imageType,
        if (orientation != null) 'orientation': orientation,
        if (category != null) 'category': category,
      },
    );

    return await _makeRequest(uri);
  }

  Uri _buildUri({
    required String baseUrl,
    required Map<String, String> queryParameters,
  }) {
    return Uri.parse(baseUrl).replace(
      queryParameters: queryParameters,
    );
  }

  Future<Map<String, dynamic>> _makeRequest(Uri uri) async {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw PixabayException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }
}

class PixabayException implements Exception {
  final int statusCode;
  final String message;

  PixabayException({
    required this.statusCode,
    required this.message,
  });

  @override
  String toString() => 'PixabayException($statusCode): $message';
}
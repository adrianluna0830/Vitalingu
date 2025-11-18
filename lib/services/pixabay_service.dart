import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/settings.dart';
@injectable
class PixabayService {
  final String _baseUrl = 'https://pixabay.com/api/';
  final PixabaySettings _pixabaySettings;

  PixabayService({required PixabaySettings pixabaySettings}) : _pixabaySettings = pixabaySettings;
  

  Future<Map<String, dynamic>> searchImages({
    String? q,
    String? imageType,
    String? orientation,
    String? category,
  }) async {
    if (_pixabaySettings.apiKey == null) {
      throw Exception('Pixabay API key is not set.');
    }

    final uri = _buildUri(
      baseUrl: _baseUrl,
      queryParameters: {
        'key': _pixabaySettings.apiKey!,
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
      throw Exception('Pixabay API error: ${response.statusCode} - ${response.body}');
    }
  }
}


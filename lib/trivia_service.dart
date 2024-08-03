import 'dart:convert';
import 'package:http/http.dart' as http;

class TriviaService {
  final String _baseUrl = 'https://opentdb.com/api.php';

  Future<List<Map<String, dynamic>>> fetchQuestions(
      {required String difficulty}) async {
    final url = '$_baseUrl?amount=10&difficulty=$difficulty';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse['results']);
    } else {
      throw Exception('Failed to load questions');
    }
  }
}

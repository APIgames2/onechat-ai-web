import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendMessageToChatGPT(String message) async {
  String apiKey = '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'; // Remplacez par votre clé API OpenAI
  String url = 'https://api.openai.com/v1/chat/completions';

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  Map<String, dynamic> body = {
    'prompt': message,
    'max_tokens': 50,
    'temperature': 0.7,
  };

  var response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    String chatResponse = data['choices'][0]['text'];
    return chatResponse;
  } else {
    throw Exception('Failed to communicate with ChatGPT');
  }
}

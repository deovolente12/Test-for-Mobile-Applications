import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Randomizer> fetchRandomizer() async {
  final response = await http.get(Uri.parse('https://csrng.net/csrng/csrng.php?min=1&max=1000'));
  if (response.statusCode == 200) {
    dynamic json = jsonDecode(response.body);
    return Randomizer.fromJson(json[0]);
  }
  else {
    throw Exception('Failed to Load!');
  }
}

class Randomizer {

  int random;


  Randomizer.fromJson(Map json)
  :
  random = json['random'];

  Map toJson() {
    return {'random': random};
  }

}



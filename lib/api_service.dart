import 'package:http/http.dart' as http;
import 'dart:convert';

import 'modal_class/weather_modal_class.dart';

Future<Createuser> fetchweatherdata() async {
  final response = await http.get(
    Uri.parse('https://easy-weather1.p.rapidapi.com/daily/5?longitude=103.86&latitude=1.28' ),
    headers: {
      'Accept': 'application/json',


      // RapidAPI host
      'x-rapidapi-host' : 'easy-weather1.p.rapidapi.com',

// Add your RapidAPI key here
      'x-rapidapi-key' : 'b5830754e6mshd0c033ad70c8e2fp174a1bjsnab60271ce4b4',
    },
  );



  print("STATUS CODE: ${response.statusCode}");
  print("RESPONSE BODY: ${response.body}");

  if (response.statusCode == 200) {
    try {
      final jsonData = jsonDecode(response.body);

      print("JSON DECODE SUCCESS");

      final data = Createuser.fromJson(jsonData);

      print("MODEL PARSING SUCCESS");

      return data;
    } catch (e, stackTrace) {
      print("MODEL ERROR: $e");
      print("STACK TRACE: $stackTrace");

      rethrow;
    }
  } else {
    throw Exception(
      'Failed to load weather data: ${response.statusCode}',
    );
  }
}

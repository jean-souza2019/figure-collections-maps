import 'dart:math';

import 'package:dio/dio.dart';
import '../model/list_positions.dart';


Future<ListPersons?> getPositions() async {
  Dio dio = Dio();
  ListPersons? persons;
  try {
    Response response = await dio
        .get('https://run.mocky.io/v3/2b417b21-8b69-43db-a0f6-c31ae8cb528f');
    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      persons = ListPersons.fromJson(jsonResponse);
    }
  } finally {
    dio.close();
  }
  return persons;
}

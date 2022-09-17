import 'package:dio/dio.dart';
import '../model/list_positions.dart';

//Dica: estudem o pacote Dio, ele é sensacional: https://pub.dev/packages/dio
//Dica: para quem deseja tomar um caminho profissional no Flutter, indico o conhecimento
//do pacote Retrofit: https://pub.dev/packages/retrofit

Future<ListPositions?> getPositions() async {
  Dio dio = Dio();
  ListPositions? positions;
  try {
    Response response = await dio
        .get('https://run.mocky.io/v3/b784ae68-e3f8-4306-aa1d-2a33e3acfa35');
    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      if (jsonResponse["success"]) {
        positions = ListPositions.fromJson(jsonResponse);
      }
    }
  } finally {
    dio.close();
  }
  return positions;
}

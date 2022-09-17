class Position {
  double lat;
  double lng;
  String data;
  int angulo;
  int velocidade;
  String veiculo_placa;
  String condutor_nome;

  Position(
    this.lat,
    this.lng,
    this.data,
    this.angulo,
    this.velocidade,
    this.veiculo_placa,
    this.condutor_nome
  );

  //dica de estudo. Pacote json_serializble
  //documentação aqui: https://docs.flutter.dev/development/data-and-backend/json

  Position.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lng = json['lng'],
        data = json['data'],
        angulo = json['angulo'],
        velocidade = json['velocidade'],
        veiculo_placa = json['veiculo_placa'],
        condutor_nome = json['condutor_nome'];
}






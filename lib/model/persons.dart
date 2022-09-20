class Person {
  int id;
  String nome;
  double lat;
  double long;
  int total;
  List<String> repeated;

  Person(this.id, this.nome, this.lat, this.long, this.total, this.repeated);

  Person.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nome = json['nome'],
      lat = json['lat'],
      long = json['long'],
      total = json['total'],
      repeated = json['repeated'].cast<String>();
}

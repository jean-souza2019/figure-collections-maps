import 'package:figure_collections_maps/model/persons.dart';

class ListPersons {
  List<Person> persons;

  ListPersons(this.persons);

  ListPersons.fromJson(Map<String, dynamic> json)
      : persons = buildListPersons(json['data']);

  //javascript = arrow function
  //java = lambda
  static List<Person> buildListPersons(List<dynamic> list) =>
      list.map((item) => Person.fromJson(item)).toList();
}
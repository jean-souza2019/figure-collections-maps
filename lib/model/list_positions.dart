import 'package:figure_collections_maps/model/position.dart';

class ListPositions {
  List<Position> positions;

  ListPositions(this.positions);

  ListPositions.fromJson(Map<String, dynamic> json)
      : positions = buildListPositions(json['data']);

  //javascript = arrow function
  //java = lambda
  static List<Position> buildListPositions(List<dynamic> list) =>
      list.map((item) => Position.fromJson(item)).toList();
}

import 'package:figure_collections_maps/model/sticker.dart';

class ListSticker {
  List<StickerArguments> sticker;

  ListSticker(this.sticker);

  ListSticker.fromJson(Map<String, dynamic> json)
      : sticker = buildListSticker(json['data']);

  static List<StickerArguments> buildListSticker(List<dynamic> list) => list.map((item) => StickerArguments.fromJson(item)).toList();
}
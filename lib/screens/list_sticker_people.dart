import 'package:figure_collections_maps/model/sticker.dart';
import 'package:flutter/material.dart';

class ListStickerPeople extends StatelessWidget {
  const ListStickerPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StickerArguments;
    TextStyle style20dp = const TextStyle(fontSize: 20);
    TextStyle style27dp = const TextStyle(fontSize: 27);

    return Scaffold(
      appBar: AppBar(title: Text("Figures of " + args.nome)),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Center(
              child: new Text(
            args.nome,
            style: style27dp,
          )),
          for (var repeated in args.repeated)
            Center(
                child: new Text(
              repeated,
              style: style20dp,
            ))
        ],
      ),
    );
  }
}

class StickerArguments {
  String nome;
  List<String> repeated;

  StickerArguments(this.nome, this.repeated);

  StickerArguments.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        repeated = json['repeated'].cast<String>();
}
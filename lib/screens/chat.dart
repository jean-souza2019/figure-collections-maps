import 'package:figure_collections_maps/providers/GeneralProvider.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);
  @override
  ChatState createState() => ChatState();
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

class ChatState extends State<Chat> {
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    String titleChat = Provider.of<GeneralProvider>(context, listen: false).listTitleChat();
    return Scaffold(
        appBar: AppBar(
          title: Text(titleChat),
        ),
        body: Column(
          children: [
            Expanded(
                child: GroupedListView<Message, DateTime>(
                    padding: const EdgeInsets.all(8),
                    elements: messages,
                    groupBy: (message) => DateTime(2022),
                    groupHeaderBuilder: (Message message) => SizedBox(),
                    itemBuilder: (context, Message message) => Align(
                          alignment: message.isSentByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(message.text),
                            ),
                          ),
                        ))),
            Container(
              color: Colors.grey.shade300,
              child: TextField(
                decoration: const InputDecoration(
                    suffixIcon: const Icon(Icons.send),
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Escreva algo aqui...'),
                onSubmitted: (text) {
                  final message = Message(
                    text: text,
                    date: DateTime.now(),
                    isSentByMe: true,
                  );

                  setState(() => messages.add(message));
                },
              ),
            ),
          ],
        ));
  }
}

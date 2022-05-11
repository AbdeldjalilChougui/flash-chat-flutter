import 'package:flash_chat/components/message_bubble.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {

  MessageStream({this.firestore});
  final firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore.collection("messages").orderBy("date").snapshots(),
      builder: (context,snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        List<MessageBubble> messageBubbles = [];
        final messages = snapshot.data.documents.reversed;
        for (var message in messages) {
          final messageText = message.data["text"];
          final messageSender = message.data["sender"];

          final currentUser = loggedInUser.email;
          if (currentUser == messageSender) {

          }
          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talkio_app/Features/auth/model/user_model.dart';
import 'package:talkio_app/Features/chat/chat_page.dart';
import 'package:talkio_app/Features/chat/models/room_models.dart';

class ChatCard extends StatelessWidget {
  final ChatRoom item;
  const ChatCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    String userId = item.members
        .where((element) => element != FirebaseAuth.instance.currentUser!.uid)
        .first;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel userModel = UserModel.fromJson(snapshot.data!.data()!);

          return Card(
            elevation: 0.0,
            color: const Color.fromARGB(255, 127, 136, 179),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      chatID: item.id,
                      userModel: userModel,
                    ),
                  ),
                );
              },
              leading: const CircleAvatar(
                radius: 30,
                child: Text('img'),
              ),
              title: Text(userModel.name),
              subtitle: Text(item.lastMessage == "" ? userModel.about : item.lastMessage),
              trailing: 1 / 1 == 0
                  ? Badge(
                      label: Text('3'),
                      largeSize: 22.0,
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    )
                  : Text(''),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

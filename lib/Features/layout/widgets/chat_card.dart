
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talkio_app/Features/auth/model/user_model.dart';
import 'package:talkio_app/Features/chat/chat_page.dart';
import 'package:talkio_app/Features/chat/models/message_model.dart';
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
              subtitle: Text(
                item.lastMessage == "" ? userModel.about : item.lastMessage,
              ),
              trailing: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('rooms')
                    .doc(item.id)
                    .collection('messages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final unreadList = snapshot.data?.docs
                        .map((e) => MessageModel.fromJson(e.data()))
                        .where((element) => element.read == "")
                        .where((element) =>
                            element.fromId !=
                            FirebaseAuth.instance.currentUser!.uid) ?? [];
                    return unreadList.length != 0
                        ? Badge(
                            label: Text(unreadList.length.toString()),
                            largeSize: 22.0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                          )
                        : Text(
                            DateFormat.yMMMEd().format(
                              DateTime.fromMillisecondsSinceEpoch(
                                int.parse(item.lastMessageTime),
                              ),
                            ),
                          );
                  } else {
                    return Container();
                  }
                },
              ),
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

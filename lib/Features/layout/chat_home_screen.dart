import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/chat/models/room_models.dart';
import 'package:talkio_app/Features/layout/widgets/chat_card.dart';
import 'package:talkio_app/Features/layout/widgets/custom_bottom_sheet.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) => CustomBottomSheet(),
          );
        },
        child: const Icon(
          Iconsax.message_add,
          size: 26,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .where('members',
                          arrayContains: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ChatRoom> chats = snapshot.data!.docs
                          .map(
                            (e) => ChatRoom.fromJson(
                              e.data(),
                            ),
                          )
                          .toList()
                        ..sort(
                          (a, b) =>
                              b.lastMessageTime.compareTo(a.lastMessageTime),
                        );
                      return ListView.builder(
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          return const ChatCard();
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

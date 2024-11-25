import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talkio_app/Features/chat/models/message_model.dart';

class ChatMessageCard extends StatelessWidget {
  final int index;
  final MessageModel messageItem;
  const ChatMessageCard({
    super.key,
    required this.index,
    required this.messageItem,
  });
  @override
  Widget build(BuildContext context) {
    bool isMe = messageItem.fromId == FirebaseAuth.instance.currentUser!.uid;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_note_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
              )
            : const SizedBox(),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(isMe ? 16.0 : 0.0),
              bottomRight: Radius.circular(isMe ? 0.0 : 16.0),
              topRight: const Radius.circular(16),
              topLeft: const Radius.circular(16),
            ),
          ),
          color: isMe
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 2.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    messageItem.message,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 5),
                      isMe
                          ? const Icon(
                              Icons.check_circle_outlined,
                              size: 18,
                              color: Colors.blueAccent,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat.yMMMEd()
                            .format(DateTime.fromMillisecondsSinceEpoch(int.parse(messageItem.createdAt)))
                            .toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talkio_app/Features/chat/models/message_model.dart';
import 'package:talkio_app/firbase/fire_database.dart';

class ChatMessageCard extends StatefulWidget {
  final int index;
  final bool selected;
  final MessageModel messageItem;
  final String roomId;
  const ChatMessageCard({
    super.key,
    required this.index,
    required this.messageItem,
    required this.roomId, required this.selected,
  });

  @override
  State<ChatMessageCard> createState() => _ChatMessageCardState();
}

class _ChatMessageCardState extends State<ChatMessageCard> {
  @override
  void initState() {
    if (widget.messageItem.toId == FirebaseAuth.instance.currentUser!.uid) {
      FireData().readMessage(widget.roomId, widget.messageItem.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMe =
        widget.messageItem.fromId == FirebaseAuth.instance.currentUser!.uid;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color:widget.selected? Colors.grey : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                      widget.messageItem.message,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 5),
                        isMe
                            ? Icon(
                                Icons.check_circle_outlined,
                                color: widget.messageItem.read == ''
                                    ? Colors.grey
                                    : Colors.blueAccent,
                                size: 18,
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .format(DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(widget.messageItem.createdAt)))
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
      ),
    );
  }
}

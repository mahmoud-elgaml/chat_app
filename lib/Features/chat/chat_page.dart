import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/auth/model/user_model.dart';
import 'package:talkio_app/Features/chat/models/message_model.dart';
import 'package:talkio_app/Features/chat/widgets/chat_message_card.dart';
import 'package:talkio_app/Features/chat/widgets/input_message_field.dart';
import 'package:talkio_app/firbase/fire_database.dart';

class ChatPage extends StatefulWidget {
  final String chatID;
  final UserModel userModel;
  const ChatPage({super.key, required this.chatID, required this.userModel});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  List selectedMessages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.userModel.name,
            ),
            Text(
              widget.userModel.lastActivated,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.call_calling),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.trash),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('rooms')
                    .doc(widget.chatID)
                    .collection('messages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MessageModel> messageItems = snapshot.data!.docs
                        .map((e) => MessageModel.fromJson(e.data()))
                        .toList()
                      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
                    return messageItems.isNotEmpty
                        ? ListView.builder(
                            reverse: true,
                            itemCount: messageItems.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMessages.isNotEmpty
                                        ? selectedMessages.contains(
                                                messageItems[index].id)
                                            ? selectedMessages
                                                .remove(messageItems[index].id)
                                            : selectedMessages
                                                .add(messageItems[index].id)
                                        : null;
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    selectedMessages
                                            .contains(messageItems[index].id)
                                        ? selectedMessages
                                            .remove(messageItems[index].id)
                                        : selectedMessages
                                            .add(messageItems[index].id);
                                  });
                                },
                                child: ChatMessageCard(
                                  selected: selectedMessages
                                      .contains(messageItems[index].id),
                                  roomId: widget.chatID,
                                  index: index,
                                  messageItem: messageItems[index],
                                ),
                              );
                            },
                          )
                        : GestureDetector(
                            onTap: () {
                              FireData()
                                  .sendMessage(
                                    widget.userModel.id,
                                    "Hello ${widget.userModel.name} 👋",
                                    widget.chatID,
                                  )
                                  .then(
                                    (value) => messageController.clear(),
                                  );
                            },
                            child: Center(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(60.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '👋',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Say Hello",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InputMessageField(
                    messageController: messageController,
                  ),
                ),
                IconButton.filled(
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      FireData()
                          .sendMessage(widget.userModel.id,
                              messageController.text, widget.chatID)
                          .then(
                            (value) => messageController.clear(),
                          );
                    }
                  },
                  icon: const Icon(
                    Iconsax.send_1,
                    size: 26,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/chat/widgets/chat_message_card.dart';
import 'package:talkio_app/Features/chat/widgets/input_message_field.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mahmoud',
            ),
            Text(
              'Last seen 11:28',
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
              child: ListView.builder(
                itemCount: 20,
                // reverse: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(4),
                itemBuilder: (context, index) {
                  return ChatMessageCard(index: index);
                },
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: InputMessageField(),
                ),
                IconButton.filled(
                  onPressed: () {},
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

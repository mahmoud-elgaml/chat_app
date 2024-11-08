import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ChatCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

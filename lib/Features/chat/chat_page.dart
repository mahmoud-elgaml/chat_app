import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/auth/model/user_model.dart';
import 'package:talkio_app/Features/chat/widgets/input_message_field.dart';

class ChatPage extends StatelessWidget {
  final String chatID;
  final UserModel userModel;
  const ChatPage({super.key, required this.chatID, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel.name,
            ),
            Text(
              userModel.lastActivated,
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
              child: GestureDetector(
                onTap: () {},
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
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Say Hello",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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

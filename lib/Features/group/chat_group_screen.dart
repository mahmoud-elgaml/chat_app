import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/chat/widgets/input_message_field.dart';
import 'package:talkio_app/Features/group/group_member_screen.dart';
import 'package:talkio_app/Features/group/widgets/group_message_card.dart';

class GroupPage extends StatelessWidget {
  final TextEditingController messageController;

  const GroupPage({super.key, required this.messageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Group Name',
            ),
            Text(
              'Ahmed, Mahmoud, Tarek .....',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GroupMembersScreen(),
                ),
              );
            },
            icon: const Icon(
              Iconsax.user,
              size: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                reverse: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(4),
                itemBuilder: (context, index) {
                  return GroupMessageCard(
                    index: index,
                  );
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

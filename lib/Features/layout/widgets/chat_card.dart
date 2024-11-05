import 'package:flutter/material.dart';
import 'package:talkio_app/Features/chat/chat_page.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: const Color.fromARGB(255, 127, 136, 179),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatPage(),
            ),
          );
        },
        leading: const CircleAvatar(
          radius: 30,
        ),
        title: const Text('Name'),
        subtitle: const Text('latestMessage'),
        trailing: const Badge(
          label: Text('3'),
          largeSize: 22.0,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ),
    );
  }
}

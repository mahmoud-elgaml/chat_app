import 'package:flutter/material.dart';
import 'package:talkio_app/utils/colors.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: const Color.fromARGB(255, 127, 136, 179),
      child: ListTile(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const CreateGroupPage(),
          //   ),
          // );
        },
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: kPrimaryColor,
          child: const Text('G'),
        ),
        title: const Text('Group'),
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

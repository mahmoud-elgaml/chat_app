import 'package:flutter/material.dart';

class GroupInputMessageField extends StatelessWidget {

  const GroupInputMessageField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      margin: const EdgeInsets.all(8),
      child: TextField(
        maxLines: 5,
        minLines: 1,
        decoration: InputDecoration(
          hintText: 'write a message',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
              strokeAlign: 2,
              width: 20,
              style: BorderStyle.solid,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.emoji_emotions_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputMessageField extends StatelessWidget {
  final TextEditingController messageController;

  const InputMessageField({
    required this.messageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      margin: const EdgeInsets.all(8),
      child: TextField(
        controller: messageController,
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
                onPressed: () async{
                  ImagePicker imagePicker = ImagePicker();
                  XFile? image = await imagePicker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                     log(image.path);
                  }
                },
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

import 'package:flutter/material.dart';

class ChatMessageCard extends StatelessWidget {
  final int index;

  const ChatMessageCard({
    super.key, required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        index % 2 == 0
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
              bottomLeft: Radius.circular(index % 2 == 0 ? 16.0 : 0.0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0.0 : 16.0),
              topRight: const Radius.circular(16),
              topLeft: const Radius.circular(16),
            ),
          ),
          color: index % 2 == 0
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
                  const Text(
                    'messages How Are You Mahmoud',
                    // style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '11:30 pm',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(width: 5),
                      index % 2 == 0
                          ? const Icon(
                              Icons.check_circle_outlined,
                              size: 18,
                              color: Colors.blueAccent,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

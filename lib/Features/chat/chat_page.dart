import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                  return Row(
                    mainAxisAlignment: index % 2 == 0
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                     index % 2 == 0
                        ?  IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_note_outlined,
                          color: Colors.grey,
                          size: 28,
                        ),
                      ) : const SizedBox(),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(index % 2 == 0 ? 16.0 : 0.0),
                            bottomRight:
                                Radius.circular(index % 2 == 0 ? 0.0 : 16.0),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
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
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
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
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 16),
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
                  ),
                ),
                IconButton.filled(
                  // splashColor: kPrimaryColor,
                  // color: Colors.indigo,
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

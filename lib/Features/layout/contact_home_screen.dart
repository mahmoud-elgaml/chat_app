import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/auth/widgets/custom_button.dart';
import 'package:talkio_app/Features/auth/widgets/custom_text_field.dart';
import 'package:talkio_app/Features/layout/widgets/contact_card.dart';
import 'package:talkio_app/utils/colors.dart';

class ContactHomeScreen extends StatefulWidget {
  const ContactHomeScreen({super.key});

  @override
  State<ContactHomeScreen> createState() => _ContactHomeScreenState();
}

class _ContactHomeScreenState extends State<ContactHomeScreen> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  bool searched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Add Friend',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      IconButton.filled(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.scan_barcode,
                          size: 20,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    hintText: 'Name',
                    prefixIcon: Iconsax.direct_inbox,
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                    text: 'Add Contact',
                    color: Theme.of(context).colorScheme.primaryContainer,
                    padding: const EdgeInsets.all(16),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Iconsax.user_add,
          size: 26,
        ),
      ),
      appBar: AppBar(
        title: searched
            ? Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      autofocus: true,
                      controller: searchController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide()),
                        labelText: 'Search contact',
                      ),
                    ),
                  ),
                ],
              )
            : const Text(
                'My Contacts',
              ),
        actions: [
          searched
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searched = false;
                    });
                  },
                  icon: const Icon(
                    Iconsax.close_circle,
                    size: 30,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      searched = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ContactCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

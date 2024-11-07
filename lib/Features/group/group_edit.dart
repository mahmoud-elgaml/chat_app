import 'package:flutter/material.dart';
import 'package:talkio_app/Features/auth/widgets/custom_text_field.dart';

class EditGroupPage extends StatefulWidget {
  const EditGroupPage({super.key});

  @override
  State<EditGroupPage> createState() => _EditGroupPageState();
}

class _EditGroupPageState extends State<EditGroupPage> {
  TextEditingController gNameController = TextEditingController();
@override
  void initState() {
    super.initState();
    gNameController.text = 'Name';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Done'),
        onPressed: () {},
        backgroundColor: Colors.indigo,
        icon: const Icon(Icons.check_circle_outline),
      ),
      appBar: AppBar(
        title: const Text('Edit Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 6.0,
                      ),
                      child: CircleAvatar(
                        radius: 45,
                        child: Text(
                          'G',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -6.0,
                      right: -1.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 28,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Group Name',
                    prefixIcon: Icons.group_outlined,
                    controller: gNameController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2,
              endIndent: 15.0,
              indent: 15.0,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text('Add Members'),
                Spacer(),
                Text('0'),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    title: const Text('name'),
                    checkboxShape: const CircleBorder(),
                  ),
                  CheckboxListTile(
                    value: false,
                    onChanged: (value) {},
                    title: const Text('name'),
                    checkboxShape: const CircleBorder(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

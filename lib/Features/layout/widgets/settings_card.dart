import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard(
      {super.key, this.leading, this.onPressed, this.title, this.trailing});

  final Widget? trailing;
  final Widget? leading;
  final void Function()? onPressed;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        title: title,
        trailing: trailing,
        leading: leading,
        onTap: onPressed,
      ),
    );
  }
}

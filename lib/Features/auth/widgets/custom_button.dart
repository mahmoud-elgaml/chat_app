import 'package:flutter/material.dart';
import 'package:talkio_app/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      this.padding = const EdgeInsets.all(0)});
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0.0,
        padding: padding,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {super.key,
      required this.text,
      this.onPressed,
      this.padding = const EdgeInsets.all(0)});
  final String text;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: kPrimaryColor),
        ),
        elevation: 0.0,
        padding: padding,
      ),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}

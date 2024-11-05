import 'package:flutter/material.dart';
import 'package:talkio_app/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.validator,
    this.isPass = false,
  });
  final bool isPass;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.isPass ? !showPassword : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: kPrimaryColor,
          ),
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: kPrimaryColor,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.all(20.0),
          hintStyle: TextStyle(
            color: kGreyColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}

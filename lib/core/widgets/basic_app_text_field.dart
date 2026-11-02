import 'package:flutter/material.dart';

class BasicAppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const BasicAppTextField({
    super.key,
     this.hintText,
     this.controller,
    this.focusNode,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      textAlign: TextAlign.right,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

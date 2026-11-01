import 'package:flutter/material.dart';

class BasicPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  const BasicPasswordField({
    super.key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
  });

  @override
  State<BasicPasswordField> createState() => _BasicPasswordFieldState();
}

class _BasicPasswordFieldState extends State<BasicPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: widget.hintText,

        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}

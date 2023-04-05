import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // -- Props --
  final String title;
  final bool isMasked;
  final bool isMaskedDisabled;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.title,
    this.isMasked = false,
    this.isMaskedDisabled = false,
    required this.controller,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  // -- States --
  bool _isTextVisible = false;

  // -- Actions --
  void onTapVisibleIcon() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            suffixIcon: (widget.isMasked && !widget.isMaskedDisabled)
                ? IconButton(
                    onPressed: onTapVisibleIcon,
                    icon: Icon(_isTextVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            // enabledBorder: OutlineInputBorder(),
          ),
          obscureText: widget.isMasked ? !_isTextVisible : false,
          controller: widget.controller,
          onChanged: (value) {},
        ),
      ],
    );
  }
}

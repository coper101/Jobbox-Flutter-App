import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // -- Props --
  final String? title;
  final String placeholder;
  final bool isOutlined;
  final bool isMasked;
  final bool isMaskedDisabled;
  final Widget? prefixIcon;
  final bool enabled;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    this.title,
    this.isOutlined = true,
    required this.placeholder,
    this.isMasked = false,
    this.isMaskedDisabled = false,
    this.prefixIcon,
    this.enabled = false,
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
        if (widget.title != null)
          Text(
            widget.title!,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        const SizedBox(height: 12),
        TextField(
          enabled: widget.enabled,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            label: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                widget.placeholder,
              ),
            ),
            fillColor: Colors.white.withOpacity(widget.enabled ? 1 : 0.3),
            filled: !widget.isOutlined,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            suffixIcon: (widget.isMasked && !widget.isMaskedDisabled)
                ? IconButton(
                    onPressed: onTapVisibleIcon,
                    icon: Icon(_isTextVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  )
                : null,
            prefixIcon: widget.prefixIcon,
            prefixIconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 42, minHeight: 38),
            border: OutlineInputBorder(
              borderSide:
                  widget.isOutlined ? const BorderSide() : BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          obscureText: widget.isMasked ? !_isTextVisible : false,
          controller: widget.controller,
          onChanged: (value) {},
        ),
      ],
    );
  }
}

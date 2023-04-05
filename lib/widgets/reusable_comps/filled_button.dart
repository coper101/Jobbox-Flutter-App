import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  // -- Props --
  final String title;
  final VoidCallback onTap;

  MyFilledButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final _borderRadius = BorderRadius.circular(8);

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      borderRadius: _borderRadius,
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: Colors.orange,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

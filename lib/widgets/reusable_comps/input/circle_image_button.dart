import 'package:flutter/material.dart';

class CircleImageButon extends StatelessWidget {
  // -- Props --
  final String title;
  final VoidCallback onTap;

  const CircleImageButon({
    super.key,
    required this.title,
    required this.onTap,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black.withOpacity(0.05),
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Ink(
        width: 84,
        height: 84,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all()),
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

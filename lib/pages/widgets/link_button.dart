import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final double textSize;
  final String title;
  final bool isNeedToUnderline;
  final Color buttonColor;
  final Function() onTap;

  const LinkButton({
    super.key,
    required this.textSize,
    required this.title,
    required this.isNeedToUnderline,
    required this.buttonColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 180),
      child: GestureDetector(
        onTap: onTap,
        child: isNeedToUnderline
            ? Text(
                title,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: buttonColor,
                      offset: const Offset(0, -1),
                    ),
                  ],
                  decoration: TextDecoration.underline,
                  decorationColor: buttonColor,
                  color: Colors.transparent,
                  fontWeight: FontWeight.w400,
                  fontSize: textSize,
                ),
              )
            : Text(
                title,
                style: TextStyle(
                  color: buttonColor,
                  fontWeight: FontWeight.w400,
                  fontSize: textSize,
                ),
              ),
      ),
    );
  }
}

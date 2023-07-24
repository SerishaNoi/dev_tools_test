import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final IconData? buttonIcon;
  final String title;
  final double titleSize;
  final Color titleColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool? isButtonDisabled;
  final Function() onPressed;

  const MainButton({
    super.key,
    this.buttonIcon,
    required this.title,
    required this.titleSize,
    required this.titleColor,
    this.iconColor,
    this.backgroundColor,
    this.isButtonDisabled = false,
    required this.onPressed,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: widget.isButtonDisabled ?? false ? null : widget.onPressed,
        style: ButtonStyle(
          overlayColor: widget.backgroundColor == null
              ? MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) return AppColors.hovarButton;

                    if (states.contains(MaterialState.pressed)) return AppColors.mainButton;
                    return null;
                  },
                )
              : MaterialStateProperty.all(widget.backgroundColor),
          iconColor: MaterialStateProperty.all(AppColors.white),
          backgroundColor: MaterialStateProperty.all(
            widget.backgroundColor ??
                (widget.isButtonDisabled ?? false ? AppColors.bgCard : AppColors.mainButton),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.buttonIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      widget.buttonIcon,
                      color: widget.iconColor,
                    ),
                  )
                : const SizedBox(),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: widget.titleSize,
                color: widget.isButtonDisabled ?? false ? AppColors.violetHard : widget.titleColor,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

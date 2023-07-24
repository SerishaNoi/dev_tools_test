import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class StyledTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const StyledTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<StyledTextField> createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  bool hasFocus = false;
  bool onTextFieldSelected = false;
  bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    // Сделать эрор бордер
    return MouseRegion(
      opaque: false,
      onEnter: (focus) {
        setState(() {
          hasFocus = true;
        });
      },
      onExit: (event) {
        setState(() {
          hasFocus = false;
        });
      },
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: widget.controller,
              onChanged: (value) {
                value.length < 5 && value.isNotEmpty ? isValidate = true : isValidate = false;
              },
              onTap: () {
                setState(() {
                  onTextFieldSelected = true;
                });
              },
              decoration: InputDecoration(
                suffixIcon: isValidate
                    ? const Padding(
                        padding: EdgeInsets.only(right: 23, left: 10),
                        child: Icon(Icons.info_outline, color: AppColors.no),
                      )
                    : const SizedBox(),
                errorBorder: isValidate
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.no,
                          width: 2,
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isValidate
                        ? AppColors.no
                        : hasFocus
                            ? AppColors.violetHard
                            : AppColors.violetLight,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                floatingLabelStyle: TextStyle(
                  color: isValidate
                      ? AppColors.textLight
                      : onTextFieldSelected
                          ? AppColors.violetLight
                          : AppColors.textP,
                ),
                labelText: isValidate ? ' Ошибка ' : ' ${widget.label} ',
                labelStyle: TextStyle(
                  color: hasFocus ? AppColors.textP : AppColors.violetLight,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: isValidate ? AppColors.no : AppColors.violetHard, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.bgCard, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              cursorColor: AppColors.textP,
              style: TextStyle(color: isValidate ? AppColors.textLight : AppColors.textP),
            ),
          ),
        ],
      ),
    );
  }
}

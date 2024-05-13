import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.label,
    this.controller,
    this.icon,
    this.keyboardType,
  });

  final String? label;
  final TextEditingController? controller;
  final IconData? icon;
  final TextInputType? keyboardType;

// final VoidCallback? onPressed,

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (ev) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (value)
      {
        if(value!.isEmpty)
        {
          return "Field is Required";
        }
        return null;
      },
      obscureText: widget.keyboardType == TextInputType.visiblePassword && isPassword,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 14.sp,
        ),
        suffixIcon: widget.keyboardType == TextInputType.visiblePassword
            ? IconButton(
                onPressed: () {
                  isPassword = !isPassword;
                  setState(() {});
                },
                icon: Icon(
                  isPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              )
            : Icon(widget.icon),
      ),
    );
  }

  bool isPassword = true;
}

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false, required this.width, required this.height,
  });

  final bool isLoading;
  final String text;
  final VoidCallback onPressed;

  final double width, height;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? const LinearProgressIndicator()
        : FilledButton(
            onPressed: widget.onPressed,
            style: FilledButton.styleFrom(
              fixedSize: Size(widget.width, widget.height),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}

import 'package:flutter/material.dart';

class AppTextFieldPass extends StatefulWidget {
  AppTextFieldPass(
      {super.key,
      this.controller,
      this.onChanged,
      this.hintext,
      Color? bgcolor,
      this.hintColor = Colors.grey,
      this.textInputAction,
      EdgeInsetsGeometry? padding,
      BorderRadiusGeometry? borderRadius})
      : bgcolor = bgcolor ?? Colors.grey.withOpacity(0.36),
        borderRadius = borderRadius ?? BorderRadius.circular(16.0),
        padding = padding ??
            const EdgeInsets.symmetric(vertical: 2.0)
                .copyWith(left: 16.0, right: 4.0);

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? hintext;
  final Color bgcolor;
  final Color hintColor;
  final EdgeInsetsGeometry padding;
  final TextInputAction? textInputAction;
  final BorderRadiusGeometry borderRadius;

  @override
  State<AppTextFieldPass> createState() => _AppTextFieldPassState();
}

class _AppTextFieldPassState extends State<AppTextFieldPass> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.bgcolor,
        borderRadius: widget.borderRadius,
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: !showPassword,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                showPassword = !showPassword;
              }),
              child: Icon(
                Icons.remove_red_eye,
                color:
                    showPassword ? Colors.brown.withOpacity(0.9) : Colors.green,
              ),
            ),
            hintText: widget.hintext,
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: widget.hintColor,
            )),
      ),
    );
  }
}

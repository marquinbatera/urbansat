import 'package:flutter/material.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';

class InputTextFormWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function()? editingComplete;
  final void Function(String value)? onChanged;
  const InputTextFormWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.hint,
    this.obscure = false,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.editingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      height: 50,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        onEditingComplete: editingComplete,
        style: TextStyles.input,
        obscureText: obscure ? true : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          labelText: label,
          labelStyle: TextStyles.labelInput,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: TextStyles.inputHint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.stroke,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: Icon(
            icon,
            size: 25,
          ),
        ),
      ),
    );
  }
}

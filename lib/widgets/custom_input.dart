import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function? onTouched;
  final TextEditingController? textController;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final int? numOfLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final InputDecoration inputTextDecoration;
  final TextStyle textStyle;
  final TextStyle hintTextStyle;
  final Widget? prefixWidget;
  final bool? isEnabled;
  final bool readOnly;
  final bool autoFocus;
  final Widget? suffixWidget;
  const CustomInput({
    Key? key,
    this.validator,
    this.focusNode,
    required this.hintText,
    required this.textController,
    this.textInputType,
    this.numOfLines,
    this.isPassword = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.prefixWidget,
    this.suffixWidget,
    this.inputTextDecoration = const InputDecoration(
      counter: Offstage(),
      contentPadding: EdgeInsets.all(8),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: darkColor),
      ),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: disableColor)),
      disabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: disableColor)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: redColor)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
      focusedErrorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: redColor)),
      fillColor: Colors.transparent,
    ),
    this.textStyle = const TextStyle(),
    this.hintTextStyle = const TextStyle(),
    this.maxLength = 10,
    this.onChanged,
    this.isEnabled = true,
    this.onTouched,
    this.textCapitalization = TextCapitalization.words,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autofocus: autoFocus,
      controller: textController,
      cursorColor: darkColor,
      keyboardType: textInputType ?? TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      minLines: numOfLines,
      maxLines: numOfLines,
      maxLength: maxLength,
      obscureText: isPassword,
      cursorHeight: 25,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      onChanged: (value) => onChanged!(value),
      onTap: () => onTouched!(),
      style: textStyle,
      decoration: inputTextDecoration.copyWith(
          hintText: hintText,
          hintStyle: hintTextStyle,
          prefixIcon: prefixWidget,
          suffix: suffixWidget ?? const SizedBox.shrink()),
      enabled: isEnabled,
    );
  }
}

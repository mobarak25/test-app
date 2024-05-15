import 'package:flutter/material.dart';
import 'package:test_app/core/utils/colors.dart';
import 'package:test_app/core/utils/text_styles.dart';
import 'package:test_app/core/widgets/text.dart';

class TextFieldB extends StatefulWidget {
  final String? hintText, fieldTitle, labelText, errorText, helperText;
  final double? paddingHeight, paddingWidth, height;
  final TextStyle? textStyle;
  final bool isReadOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final VoidCallback? onTouch;
  final Function onChanged;
  final Color? bgColor, hintColor;
  final bool isMandatory;
  final double labelSize;
  final bool loading;
  final bool isDate;

  const TextFieldB(
      {Key? key,
      this.hintText = "",
      this.fieldTitle = "",
      this.textStyle = bBody2,
      this.labelText,
      this.errorText = '',
      this.helperText = '',
      this.maxLines = 1,
      this.maxLength,
      this.controller,
      required this.focusNode,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.suffixIcon,
      this.prefixIcon,
      this.textAlign = TextAlign.start,
      this.paddingHeight = 15,
      this.paddingWidth = 15,
      this.onTouch,
      this.height,
      this.bgColor,
      required this.onChanged,
      this.isReadOnly = false,
      this.isMandatory = false,
      this.hintColor,
      this.labelSize = 16,
      this.loading = false,
      this.isDate = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextField();
  }
}

class _TextField extends State<TextFieldB> {
  @override
  Widget build(BuildContext context) {
    widget.focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fieldTitle != null && widget.fieldTitle != '')
          Row(
            children: [
              TextB(
                text: widget.fieldTitle!,
                textStyle: TextStyle(fontSize: widget.labelSize),
                fontColor: bGray700,
              ),
              const SizedBox(width: 5),
              if (widget.isMandatory)
                const TextB(
                  text: '*',
                  textStyle: bBody1,
                  fontColor: bPurple,
                ),
            ],
          ),
        if (widget.fieldTitle != null && widget.fieldTitle != '')
          const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
              boxShadow: widget.focusNode.hasFocus
                  ? [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 0,
                        color: const Color(0XFF673AB7).withOpacity(0.2),
                      )
                    ]
                  : null),
          child: TextField(
            obscuringCharacter: '●',
            readOnly: widget.isReadOnly,
            obscureText: widget.obscureText,
            style: widget.textStyle,
            keyboardType: widget.textInputType!,
            onTap: widget.onTouch,
            onChanged: (value) {
              widget.onChanged(value);
            },
            textInputAction: TextInputAction.next,
            cursorColor: bGray,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            controller: widget.controller,
            focusNode: widget.focusNode,
            textAlign: widget.textAlign!,
            decoration: InputDecoration(
              isDense: true,
              prefixIconConstraints: const BoxConstraints(maxHeight: 40),
              prefixIcon: widget.prefixIcon != null
                  ? Container(
                      margin: const EdgeInsets.only(left: 12, right: 6),
                      child: widget.prefixIcon,
                    )
                  : null,
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 15, minWidth: 16),
              counterText: widget.maxLength == null ? '' : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.paddingWidth!,
                vertical: widget.paddingHeight!,
              ),
              suffixIcon: (widget.loading && (widget.isReadOnly))
                  ? Container(
                      height: 15,
                      width: 16,
                      margin: const EdgeInsets.only(right: 12),
                      child: const CircularProgressIndicator(
                          color: bGray, strokeWidth: 2),
                    )
                  : widget.suffixIcon != null
                      ? Container(
                          margin: const EdgeInsets.only(right: 12),
                          child: widget.suffixIcon)
                      : null,
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: widget.focusNode.hasFocus ? bPurple : bGray500,
                fontSize: 17,
              ),
              hintText: widget.hintText!,
              hintStyle: TextStyle(color: widget.hintColor),
              fillColor: widget.bgColor ?? bWhite,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bPurple),
                borderRadius: BorderRadius.circular(7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bGray),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
        if (widget.errorText != "")
          TextB(
            text: widget.errorText!,
            textStyle: bBase2,
            fontColor: bRed600,
          ),
      ],
    );
  }
}

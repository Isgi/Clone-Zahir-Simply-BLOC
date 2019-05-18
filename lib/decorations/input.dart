import 'package:flutter/material.dart';

class Input extends InputDecoration {

  String hintText;
  Icon prefixIcon;
  EdgeInsetsGeometry contentPadding;
  bool dark;
  bool collapsed;
  bool enableBorder = true;
  Color hintColor;

  Input.notCollapsed({
    @required this.hintText,
    this.prefixIcon,
    this.contentPadding,
    this.dark,
    this.enableBorder,
    this.hintColor
  }){
    this.collapsed = false;
    this.dark = dark;
    this.contentPadding = contentPadding;
  }

  @override
  InputDecoration copyWith({Widget icon, String labelText, TextStyle labelStyle, String helperText, TextStyle helperStyle, String hintText, TextStyle hintStyle, int hintMaxLines, String errorText, TextStyle errorStyle, int errorMaxLines, bool hasFloatingPlaceholder, bool isDense, EdgeInsetsGeometry contentPadding, Widget prefixIcon, Widget prefix, String prefixText, TextStyle prefixStyle, Widget suffixIcon, Widget suffix, String suffixText, TextStyle suffixStyle, Widget counter, String counterText, TextStyle counterStyle, bool filled, Color fillColor, InputBorder errorBorder, InputBorder focusedBorder, InputBorder focusedErrorBorder, InputBorder disabledBorder, InputBorder enabledBorder, InputBorder border, bool enabled, String semanticCounterText, bool alignLabelWithHint}) {
    // TODO: implement copyWith
    if (!this.collapsed) {
      return super.copyWith(
        contentPadding: this.contentPadding != null ? this.contentPadding : null,
        hintText: this.hintText,
        prefixIcon: this.prefixIcon != null ? Icon(
          this.prefixIcon.icon,
          size: 20.0,
          color: this.dark != null && this.dark ? Colors.black45 : Colors.white70,
        ) : null,
        hintStyle: TextStyle(
          color: this.hintColor != null ? this.hintColor : (this.dark != null && this.dark ? Colors.black45 : Colors.white70),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: this.enableBorder != null && this.enableBorder
              ? (this.dark != null && this.dark
                ? Colors.black45
                : Colors.white70)
              : Colors.transparent,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: this.enableBorder != null && this.enableBorder
              ? (this.dark != null && this.dark
                ? Colors.black45
                : Colors.white70)
              : Colors.transparent,
          ),
        ),
      );
    }
  }
}
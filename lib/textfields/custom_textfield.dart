import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Color? fillColor;
  final bool? filled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool? enabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool showCursor;
  final bool enableInteractiveSelection;
  final Color? cursorColor;
  final bool showBorder;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final InputBorder? customBorder;
  final InputBorder? customEnabledBorder;
  final InputBorder? customFocusedBorder;
  final InputBorder? customErrorBorder;
  final InputBorder? customFocusedErrorBorder;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double? borderWidth;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.fillColor,
    this.filled = true,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.floatingLabelStyle,
    this.contentPadding,
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.autofocus = false,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.showCursor = true,
    this.enableInteractiveSelection = true,
    this.cursorColor,
    this.showBorder = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.customBorder,
    this.customEnabledBorder,
    this.customFocusedBorder,
    this.customErrorBorder,
    this.customFocusedErrorBorder,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    // Default border radius
    final BorderRadius defaultBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(8);

    // Default border color and width
    final Color defaultBorderColor = widget.borderColor ?? Colors.grey;
    final double defaultBorderWidth = widget.borderWidth ?? 1.0;

    // Default outline border
    final defaultOutlineBorder = OutlineInputBorder(
      borderRadius: defaultBorderRadius,
      borderSide: BorderSide(
        color: defaultBorderColor,
        width: defaultBorderWidth,
      ),
    );

    // No border
    final noBorder = OutlineInputBorder(
      borderRadius: defaultBorderRadius,
      borderSide: BorderSide.none,
    );

    // Determine which borders to use
    final InputBorder border = widget.showBorder
        ? (widget.customBorder ?? defaultOutlineBorder)
        : noBorder;

    final InputBorder enabledBorder = widget.showBorder
        ? (widget.customEnabledBorder ??
            widget.customBorder ??
            defaultOutlineBorder)
        : noBorder;

    final InputBorder focusedBorder = widget.showBorder
        ? (widget.customFocusedBorder ??
            widget.customBorder ??
            defaultOutlineBorder.copyWith(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: defaultBorderWidth * 1.5,
              ),
            ))
        : noBorder;

    final InputBorder errorBorder = widget.showBorder
        ? (widget.customErrorBorder ??
            widget.customBorder ??
            defaultOutlineBorder.copyWith(
              borderSide: BorderSide(
                color: Colors.red,
                width: defaultBorderWidth,
              ),
            ))
        : noBorder;

    final InputBorder focusedErrorBorder = widget.showBorder
        ? (widget.customFocusedErrorBorder ??
            widget.customBorder ??
            defaultOutlineBorder.copyWith(
              borderSide: BorderSide(
                color: Colors.red,
                width: defaultBorderWidth * 1.5,
              ),
            ))
        : noBorder;

    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        fillColor: widget.fillColor,
        filled: widget.filled,
        hintStyle: widget.hintStyle,
        labelStyle: widget.labelStyle,
        floatingLabelStyle: widget.floatingLabelStyle,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
      ),
      style: widget.textStyle,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      textCapitalization: widget.textCapitalization,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor && !widget.readOnly,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      cursorColor: widget.cursorColor,
    );
  }
}

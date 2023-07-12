import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrdev_app/util/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final bool autofocus;
  final Function(String text)? onChange;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final TextEditingController controller;
  final String hint;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorMessage;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;
  final Color textColor;
  final bool isPasswordField;
  final bool? alignLabelWithHint;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatter;
  final bool enableInteractiveSelection;
  final bool showCursor;
  final bool isEnabled;
  final String? label;
  final String? Function(String? input)? validator;
  final Widget passwordVisibilityIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    this.autofocus = false,
    this.onChange,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.controller,
    this.hint = "",
    this.readOnly = false,
    this.onTap,
    this.errorMessage,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.onEditingComplete,
    this.textColor = Colors.white,
    this.isPasswordField = false,
    this.alignLabelWithHint,
    this.maxLength,
    this.textInputFormatter,
    this.enableInteractiveSelection = true,
    this.isEnabled = true,
    this.showCursor = true,
    this.label,
    this.validator,
    this.passwordVisibilityIcon = const SizedBox.shrink(),
    this.suffixIcon = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode myFocusNode = FocusNode();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8)
        ],
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: AppColors.backgroundColor, borderRadius: BorderRadius.circular(20.0)),
          child: TextFormField(
            textInputAction: widget.textInputAction,
            readOnly: widget.readOnly,
            cursorHeight: 20.0,
            controller: widget.controller,
            obscureText: widget.obscureText,
            onEditingComplete: widget.onEditingComplete,
            onChanged: widget.onChange,
            onTap: widget.onTap,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            enabled: widget.isEnabled,
            showCursor: widget.showCursor,
            keyboardType: widget.maxLines > 1 ? TextInputType.multiline : widget.keyboardType,
            inputFormatters: widget.textInputFormatter,
            validator: (value) {
              if (widget.validator != null) {
                setState(() {
                  errorMessage = widget.validator!(value);
                });
                debugPrint("validation errorMessage is $errorMessage");
              }
              return null;
            },
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
              fontFamily: 'roboto',
            ),
            autofocus: widget.autofocus,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: widget.hint,
              isDense: false,
              alignLabelWithHint: widget.alignLabelWithHint,
              hintStyle: const TextStyle(
                  fontSize: 14, color: AppColors.appGrey, fontWeight: FontWeight.normal),
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              border: InputBorder.none,
              suffixIcon:
                  widget.isPasswordField ? widget.passwordVisibilityIcon : widget.suffixIcon,
            ),
          ),
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 5),
          Text(
            errorMessage!,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.red),
          )
        ]
      ],
    );
  }
}

part of 'widgets.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.maxLine = 1,
    this.readOnly = false,
    this.onTap,
    this.childPadding = 20,
    this.textCapitalization,
    this.filled = false,
    this.borderColor,
    this.prefix,
  });

  final Color? borderColor;
  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int maxLine;
  final VoidCallback? onTap;
  final double childPadding;

  final bool filled;
  final Widget? prefix;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: context.theme.textTheme.labelMedium,
          ),
          const SizedBox(height: 7)
        ],
        TextFormField(
          autocorrect: false,
          autofocus: true,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          maxLines: widget.maxLine,
          onTap: widget.onTap,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscuringCharacter: '*',
          onChanged: widget.onChanged,
          validator: widget.validator,
          readOnly: widget.readOnly,
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: widget.filled,
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 16.0,
            ),
            prefixIcon: widget.prefix,
            enabledBorder:
                _border(widget.borderColor ?? context.theme.primaryColor),
            focusedBorder: _border(context.theme.primaryColor.withOpacity(0.5)),
            errorBorder: _border(Colors.red),
            focusedErrorBorder: _border(Colors.red),
            suffixIcon: widget.suffixIcon,
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}

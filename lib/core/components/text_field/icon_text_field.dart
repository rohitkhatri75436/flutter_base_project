import '../../router/export.dart';

class IconTextField extends StatefulWidget {
  const IconTextField({
    super.key,
    this.imagePath,
    required this.hint,
    this.title,
    this.isPassword = false,
    this.expands = false,
    this.iconSize,
    this.suffixIconPath,
    this.suffixOnTap,
    this.controller,
    this.validator,
    this.onChange,
    this.maxLength,
    this.focusable = true,
    this.onTap,
    this.prefixIconColor,
    this.textInputType,
    this.topPadding,
    this.buttonPadding,
    this.minLines,
    this.width,
    this.maxLines,
    this.backgroundColor,
    this.fontStyle,
    this.onAlterTap,
    this.alterWidget,
    this.isPhoneNumber = false,
    this.textAction,
    this.isCurrency = false,
    this.suffixFit,
    this.suffixSize,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.inputFormatters,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.onSaved,
    this.hintTxtColor,
    this.hintFontWeight,
    this.hintTxtSize,
    this.readOnly,
    this.subText,
    this.isRequired,
    this.errorFontSize,
    this.textFieldRadius,
    this.prefixIcon,
    this.fontSize,
    this.suffixPadding,
    this.isMandatory = false,
    this.titleColor,
    this.focusNode,
  });

  final double? iconSize;
  final Widget? prefixIcon;
  final double? errorFontSize;
  final double? width;
  final String? imagePath;
  final String hint;
  final String? title;
  final Color? prefixIconColor;
  final Color? backgroundColor;
  final Color? hintTxtColor;
  final TextEditingController? controller;
  final bool isPhoneNumber;
  final bool isCurrency;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool focusable;
  final bool isPassword;
  final FontWeight? fontStyle;
  final FontWeight? hintFontWeight;
  final double? topPadding;
  final String? suffixIconPath;
  final double? suffixPadding;
  final BoxFit? suffixFit;
  final double? suffixSize;
  final double? hintTxtSize;
  final double? buttonPadding;
  final Function()? suffixOnTap;
  final Function()? onTap;
  final Function()? onAlterTap;
  final TextCapitalization textCapitalization;
  final Widget? alterWidget;
  final AutovalidateMode autoValidateMode;
  final TextInputAction? textAction;
  final Function(String)? onChange;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool expands;
  final bool? readOnly;
  final bool isMandatory;

  final String? subText;
  final bool? isRequired;

  final TextInputType? textInputType;
  final double? textFieldRadius;
  final double? fontSize;
  final Color? titleColor;
  final FocusNode? focusNode;

  @override
  State<IconTextField> createState() => _IconTextFieldState();
}

class _IconTextFieldState extends State<IconTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.alterWidget != null)
          InkWell(
            onTap: widget.onAlterTap,
            child: widget.alterWidget,
          ),
        if (widget.title != null && widget.subText == null)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.title ?? '',
                    style: FontStyles.body2.copyWith(
                        color: widget.focusable
                            ? widget.titleColor ?? AppColors.white
                            : widget.titleColor ?? AppColors.textHint),
                  ),
                  if (widget.isMandatory)
                    Text(
                      '*',
                      style: FontStyles.body2.copyWith(color: AppColors.red),
                    ),
                ],
              ),
              SizedBox(height: widget.topPadding ?? 4.h),
            ],
          ),
        if (widget.subText != null) ...[
          RichText(
            overflow: TextOverflow.clip,
            softWrap: true,
            textDirection: TextDirection.rtl,
            maxLines: 1,
            text: TextSpan(
              text: widget.isRequired == true ? '*' : '',
              //  style: FontStyles.textFieldStyle.copyWith(color: Colors.red),
              children: <TextSpan>[
                TextSpan(
                  text: widget.title,
                  //   style: FontStyles.textFieldStyle,
                ),
                TextSpan(
                  text: widget.subText,
                  //    style: FontStyles.textFieldStyle.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
        ],
        if (widget.title != null) SizedBox(height: 4.h),
        InkWell(
          onTap: widget.onTap,
          child: SizedBox(
            width: widget.width,
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              cursorColor: AppColors.primary,
              autovalidateMode: widget.autoValidateMode,
              onSaved: widget.onSaved,
              textCapitalization: widget.textCapitalization,
              initialValue: widget.initialValue,
              textInputAction: widget.textAction,
              expands: widget.expands,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.textInputType ??
                  ((widget.isPhoneNumber)
                      ? TextInputType.number
                      : (widget.isCurrency)
                          ? const TextInputType.numberWithOptions(decimal: true)
                          : TextInputType.text),
              enabled: widget.focusable && widget.onTap == null,
              style: !_passwordVisible && widget.isPassword
                  ? FontStyles.body1
                      .copyWith(color: AppColors.textHint, fontSize: Platform.isAndroid ? 15.sp : 12.sp)
                  : FontStyles.body1.copyWith(
                      color: widget.focusable ? AppColors.white : AppColors.textHint,
                      fontSize: widget.fontSize ?? 15.sp),
              controller: widget.controller,
              focusNode: widget.focusNode,
              obscuringCharacter: '\u25cf',
              obscureText: !_passwordVisible && widget.isPassword,
              validator: widget.validator,
              onChanged: widget.onChange,
              minLines: widget.expands ? null : widget.minLines ?? 1,
              maxLines: widget.expands ? null : widget.maxLines ?? 1,
              maxLength: widget.maxLength ?? (widget.isPhoneNumber ? 10 : TextField.noMaxLength),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.border),
                  borderRadius: BorderRadius.circular(widget.textFieldRadius ?? 24),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.border),
                  borderRadius: BorderRadius.circular(widget.textFieldRadius ?? 24),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.border),
                  borderRadius: BorderRadius.circular(widget.textFieldRadius ?? 24),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textHint),
                  borderRadius: BorderRadius.circular(widget.textFieldRadius ?? 24),
                ),
                errorMaxLines: 4,
                fillColor: widget.backgroundColor ?? (widget.focusable ? AppColors.transparent : AppColors.white),
                filled: true,
                counter: const Offstage(),
                prefixIcon: widget.prefixIcon ??
                    (widget.imagePath != null
                        ? Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: SvgPicture.asset(
                              widget.imagePath!,
                              width: 20.w,
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                              height: 20.h,
                            ),
                          )
                        : null),
                hintText: widget.hint,
                helperStyle: TextStyle(fontSize: 10.sp),
                hintStyle: FontStyles.body1,
                prefixIconConstraints: BoxConstraints(
                  maxHeight: widget.iconSize ?? 30.h,
                  maxWidth: 50.w,
                  minWidth: 45.w,
                ),
                contentPadding: EdgeInsets.only(left: 12.w, top: 10.h, right: 12.w),
                // errorStyle: FontStyles.textFieldHeadingStyle.copyWith(
                //   color: AppColors.txtRed,
                //   fontSize: widget.errorFontSize ?? 12.sp,
                //   fontWeight: FontWeight.normal,
                // ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.red, width: 1),
                  borderRadius: BorderRadius.circular(widget.textFieldRadius ?? 24),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.red, width: 1),
                  borderRadius: BorderRadius.circular(widget.textFieldRadius ?? 24),
                ),
                suffixIcon: widget.suffixIconPath != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: widget.suffixOnTap,
                            child: SvgPicture.asset(
                              widget.suffixIconPath!,
                              width: widget.suffixSize ?? 25.w,
                              height: widget.suffixSize ?? 25.h,
                              fit: widget.suffixFit ?? BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(width: widget.suffixPadding ?? 14.w),
                        ],
                      )
                    : widget.isPassword
                        ? InkWell(
                            child: Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: Icon(
                                _passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                size: 24.r,
                                color: AppColors.white,
                              ),
                            ),
                            onTap: () => setState(() => _passwordVisible = !_passwordVisible),
                          )
                        : null,
                suffixIconConstraints: BoxConstraints(maxWidth: 40.w, minWidth: 40.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

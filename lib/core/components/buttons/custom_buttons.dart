import '../../router/export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.width,
    this.height,
    this.textSize,
    this.backgroundColor,
    this.btnRadius,
    this.textPadding,
    this.textColor,
    this.prefixWidget,
    this.suffixWidget,
    this.borderColor,
  });

  final VoidCallback onPressed;
  final String title;

  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final double? btnRadius;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final EdgeInsetsGeometry? textPadding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: isLoading
            ? () {}
            : () {
                ApplicationUtils.removeKeyboard(context: context);
                onPressed();
              },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: height ?? 50.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(btnRadius ?? 60.r),
            color: backgroundColor ?? AppColors.primary,
            border: Border.all(color: borderColor ?? AppColors.primary, width: 1.r),
          ),
          padding: textPadding ?? EdgeInsets.zero,
          child: isLoading
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: const CupertinoActivityIndicator(
                      color: AppColors.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (prefixWidget != null) prefixWidget!,
                    TextWidget(
                      text: title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: textSize ?? 15.sp,
                        height: 0.9,
                        color: textColor ?? AppColors.white,
                      ),
                    ),
                    if (suffixWidget != null) suffixWidget!
                  ],
                ),
        ),
      );
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.title,
      this.height,
      this.color,
      this.fontSize,
      this.fontFamily,
      this.fontWeight,
      this.isUnderLine,
      this.onTap});

  final String title;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final Color? color;
  final bool? isUnderLine;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextWidget(
        text: title,
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize ?? 14.sp,
          height: height ?? 0.9,
          color: color ?? AppColors.primary,
          decoration: isUnderLine == true ? TextDecoration.underline : null,
          decorationColor: color ?? AppColors.grey200,
        ),
      ),
    );
  }
}

class CustomCenterTextBtn extends StatelessWidget {
  const CustomCenterTextBtn(
      {super.key,
      required this.onPressed,
      required this.title,
      this.isLoading = false,
      this.width,
      this.height,
      this.textSize,
      this.backgroundColor,
      this.btnRadius,
      this.borderColor,
      this.textStyle,
      this.textColor,
      this.prefixWidget,
      this.suffixWidget});

  final Function() onPressed;
  final String title;

  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize;
  final double? btnRadius;
  final Widget? suffixWidget;
  final TextStyle? textStyle;
  final Widget? prefixWidget;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: isLoading ? null : onPressed,
        highlightColor: AppColors.transparent,
        focusColor: AppColors.transparent,
        splashColor: AppColors.transparent,
        child: Container(
          height: height ?? 52.h,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(btnRadius ?? 30.r),
            color: backgroundColor ?? AppColors.white,
            border: Border.all(
              color: borderColor ?? AppColors.primary,
            ),
          ),
          child: isLoading
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.h),
                    child: const CircularProgressIndicator(
                      color: AppColors.grey200,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (prefixWidget != null) ...[
                      prefixWidget!,
                      SizedBox(
                        width: 5.w,
                      )
                    ],
                    TextWidget(
                      text: title,
                      textAlign: TextAlign.center,
                      style: textStyle ?? FontStyles.caption,
                    ),
                    if (suffixWidget != null) suffixWidget!
                  ],
                ),
        ),
      );
}

import '../router/export.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.style,
    this.decoration,
    this.fontFamily,
    this.size,
    this.height,
    this.weight,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
  });

  final String text;
  final TextStyle? style;
  final TextDecoration? decoration;
  final String? fontFamily;
  final double? size;
  final double? height;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ??
              TextStyle(
                fontSize: size ?? 14.sp,
                fontWeight: weight ?? FontWeight.w400,
                height: height,
                color: color ?? AppColors.white,
                letterSpacing: letterSpacing ?? 0.0,
              ))
          .copyWith(
        decoration: decoration ?? TextDecoration.none,
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

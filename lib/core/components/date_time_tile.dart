import '../router/export.dart';

class DateTimeTile extends StatelessWidget {
  const DateTimeTile(
      {super.key,
      this.heading,
      required this.hintText,
      required this.onTapTile,
      this.selectedValue,
      this.headingStyle,
      this.bottomPadding,
      this.suffixSvgName,
      this.isDeActive,
      this.isMandate});

  final String? heading, hintText;
  final String? selectedValue, suffixSvgName;
  final Function() onTapTile;
  final double? bottomPadding;
  final bool? isDeActive;
  final bool? isMandate;
  final TextStyle? headingStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (heading != null)
              TextWidget(
                text: heading!,
                style: headingStyle,
              ),
            SizedBox(
              width: 3.w,
            ),
            if (isMandate == true)
              TextWidget(
                text: '*',
                color: AppColors.red,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
          ],
        ),
        InkWell(
          onTap: onTapTile,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.white,
                border: Border.all(color: AppColors.border, width: 1.w)),
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.only(left: 15.w, right: 10.w),
            width: double.infinity,
            height: 50.h,
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: selectedValue ?? hintText!,
                    color: isDeActive == true
                        ? AppColors.textHint
                        : selectedValue != null
                            ? AppColors.black
                            : AppColors.textHint,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ),
                SvgPicture.asset(
                  suffixSvgName ?? AppIcons.calendarSvg,
                  width: 17.w,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: bottomPadding ?? 10.h,
        )
      ],
    );
  }
}

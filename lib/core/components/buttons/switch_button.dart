import '../../router/export.dart';

class CustomSwitchBtn extends StatelessWidget {
  const CustomSwitchBtn(
      {super.key,
      required this.onTapSwitchValue,
      this.isLoading = false,
      this.width,
      this.height,
      this.backgroundColor,
      this.btnRadius,
      this.switchColor,
      required this.isActive,
      this.disableColor});

  final Function() onTapSwitchValue;
  final bool isLoading;
  final bool isActive;
  final double? width;
  final double? height;
  final Color? backgroundColor, disableColor;
  final Color? switchColor;
  final double? btnRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapSwitchValue,
      child: Container(
        height: height ?? 28.h,
        width: width ?? 50.w,
        decoration: BoxDecoration(
          color: isActive ? backgroundColor ?? AppColors.primary : disableColor ?? AppColors.grey300,
          borderRadius: BorderRadius.circular(
            btnRadius ?? 30.r,
          ),
        ),
        padding: EdgeInsets.all(2.h),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: 45.r,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.transparent : switchColor ?? AppColors.white,
                  borderRadius: BorderRadius.circular(
                    25.r,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 45.r,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: isSelected ? AppColors.btnActionColor:
                  color: isActive ? switchColor ?? AppColors.white : AppColors.transparent,
                  borderRadius: BorderRadius.circular(
                    30.r,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSwitchBtnWithLabel extends StatelessWidget {
  const CustomSwitchBtnWithLabel(
      {super.key,
      required this.onTapSwitchValue,
      required this.title,
      required this.isActive,
      this.bgColor,
      this.height,
      this.width,
      this.radius,
      this.titleSize,
      this.switchActiveColor,
      this.switchDisableColor});

  final String title;
  final Color? bgColor, switchDisableColor, switchActiveColor;
  final double? radius, titleSize, width, height;
  final bool isActive;
  final Function() onTapSwitchValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 10.r), color: bgColor ?? AppColors.primary),
      height: height ?? 46.h,
      width: width ?? double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: title,
            size: titleSize ?? 13.sp,
            weight: FontWeight.w500,
          ),
          CustomSwitchBtn(
            isActive: isActive,
            backgroundColor: switchActiveColor ?? AppColors.primary,
            onTapSwitchValue: onTapSwitchValue,
            disableColor: switchDisableColor,
          ),
        ],
      ),
    );
  }
}
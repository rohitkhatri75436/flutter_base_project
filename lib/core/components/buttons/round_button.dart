import '../../router/export.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key, this.backGroundColor, this.circleColor, this.centerColor, required this.title, required this.onTap});

  final Color? backGroundColor;
  final Color? circleColor;
  final Color? centerColor;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor ?? AppColors.primary,
        shape: const CircleBorder(),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: centerColor ?? AppColors.transparent,
          border: Border.all(
            width: 3.w,
            color: circleColor ?? AppColors.white,
          ),
        ),
        margin: EdgeInsets.all(8.h),
        height: 78.h,
        width: 78.w,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        child: TextWidget(
          text: title,
          color: AppColors.white,
          size: 15.sp,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

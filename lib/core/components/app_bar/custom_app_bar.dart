import '../../router/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.bgColor,
    this.subTitle,
    this.subTitleStyle,
    this.actions,
    this.backIconColor,
    this.titleStyle,
    this.bottom,
    this.centerTitle = true,
    this.isSettingOption = false,
    this.showBackPress = true,
    this.isPadding = false,
    this.appBarTitleColor,
    this.title,
    this.toolBarHeight,
    this.onBackPress,
    this.leading,
    this.leadingWidth,
    this.showProfile = false,
  });

  final PreferredSizeWidget? bottom;
  final bool centerTitle;
  final bool showBackPress;
  final bool isSettingOption;
  final bool isPadding;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final String? title;
  final Color? bgColor;
  final Color? backIconColor;
  final Color? appBarTitleColor;
  final String? subTitle;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;
  final double? toolBarHeight;
  final Widget? leading;
  final double? leadingWidth;
  final bool showProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      elevation: 0,
      backgroundColor: bgColor ?? AppColors.black,
      shadowColor: bgColor,
      centerTitle: centerTitle,
      toolbarHeight: toolBarHeight ?? 50.h,
      leadingWidth: leadingWidth ?? (isSettingOption ? 45.r : 52.r),
      surfaceTintColor: bgColor,
      leading: leading ??
          (showBackPress
              ? GestureDetector(
                  onTap: onBackPress ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Padding(
                    padding: isPadding ? EdgeInsets.only(left: 25.w) : const EdgeInsets.all(0.0),
                    child: Icon(
                      color: backIconColor ?? AppColors.white,
                      Icons.arrow_back,
                      size: 24.r,
                    ),
                  ),
                )
              : isSettingOption
                  ? Padding(
                      padding: EdgeInsets.only(left: 19.w),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, SettingsScreen.id);
                        },
                        child: SvgPicture.asset(
                          AppIcons.homeSvg,
                        ),
                      ),
                    )
                  : null),
      title: title != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: titleStyle ?? FontStyles.caption,
                  ),
                subTitle != null
                    ? Text(
                        subTitle ?? "",
                        style: subTitleStyle ?? FontStyles.body1,
                      )
                    : const SizedBox(),
              ],
            )
          : const SizedBox(),
      bottom: bottom,
      automaticallyImplyLeading: showBackPress,
      systemOverlayStyle: Theme.of(context).brightness == Brightness.light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight ?? 50.h);
}

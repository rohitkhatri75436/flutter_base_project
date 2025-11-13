import '../../router/export.dart';

class CustomDropDown<T> extends StatelessWidget {
  final List<T> items;
  final String title;
  final String hint;
  final String Function(T) displayValue;
  final Function(T) onChange;
  final VoidCallback? onRestartTap;
  final VoidCallback? onTap;
  final VoidCallback? onRemoveTap;
  final bool stretchToWidth;
  final bool isLoading;
  final bool shouldShowReload;
  final bool hasError;
  final double? borderCorners;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String? suffixIconPath;
  final BoxFit? suffixFit;
  final double? suffixSize;
  final double? labelSize;
  final double? height;
  final bool isMandatory;
  final T? value;

  const CustomDropDown({
    required this.items,
    required this.title,
    required this.hint,
    required this.displayValue,
    required this.onChange,
    super.key,
    this.onRestartTap,
    this.onTap,
    this.labelSize,
    this.horizontalPadding,
    this.height,
    this.verticalPadding,
    this.stretchToWidth = false,
    this.shouldShowReload = true,
    this.borderCorners,
    this.suffixIconPath,
    this.suffixFit,
    this.suffixSize,
    this.isLoading = false,
    this.isMandatory = false,
    this.value,
    this.hasError = false,
    this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Row(
            children: [
              Text(
                title,
                style: FontStyles.body1,
              ),
              if (isMandatory)
                Text(
                  '*',
                  style: FontStyles.body1.copyWith(color: AppColors.red),
                ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
        ],
        Container(
          margin: EdgeInsets.only(bottom: 8.r),
          child: GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: height ?? 45.h,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<T>(
                  buttonStyleData: ButtonStyleData(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding ?? 10.r,
                      vertical: verticalPadding ?? 10.r,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppColors.border,
                      ),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: isLoading
                        ? Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: SizedBox(
                              height: 14.h,
                              width: 14.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primary,
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              right: !hasError ? 2.w : 0,
                            ),
                            child: !shouldShowReload
                                ? Container()
                                : hasError
                                    ? IconButton(
                                        icon: const Icon(Icons.restart_alt),
                                        onPressed: onRestartTap,
                                      )
                                    : Row(
                                        children: [
                                          suffixIconPath != null
                                              ? Image.asset(
                                                  suffixIconPath!,
                                                  width: suffixSize ?? 24.r,
                                                  height: suffixSize ?? 24.r,
                                                  fit: suffixFit ?? BoxFit.fitHeight,
                                                )
                                              : Icon(
                                                  Icons.keyboard_arrow_down_sharp,
                                                  size: 24.r,
                                                ),
                                        ],
                                      ),
                          ),
                    openMenuIcon: Icon(
                      Icons.keyboard_arrow_up_sharp,
                      size: 24.r,
                    ),
                  ),
                  value: value,
                  isExpanded: stretchToWidth,
                  isDense: stretchToWidth,
                  selectedItemBuilder: (context) {
                    return items.map((item) {
                      return Center(
                        child: Text(
                          maxLines: 1,
                          displayValue(item),
                          style: FontStyles.body1,
                        ),
                      );
                    }).toList();
                  },
                  hint: Text(
                    hint,
                    style: FontStyles.body1,
                    maxLines: 1,
                  ),
                  underline: const Divider(
                    color: AppColors.primary,
                    height: 4,
                    thickness: 4,
                  ),
                  items: items.map((item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        displayValue(item),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16.r),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    onChange.call(value as T);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import '../router/export.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen(
      {required this.widget,
      required this.isLoading,
      this.loaderWidget,
      this.isShowEmptyWidget,
      this.onTapRetry,
      this.emptyTitle,
      super.key});
  final Widget widget;
  final Widget? loaderWidget;
  final bool isLoading;
  final bool? isShowEmptyWidget;
  final String? emptyTitle;
  final Function()? onTapRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: LoadingOverlay(
          isLoading: isLoading,
          color: Colors.black26,
          progressIndicator: Center(
            child: loaderWidget ?? _loadingWidget(),
          ),
          child: isShowEmptyWidget == true ? EmptyPageView(title: emptyTitle, onTapRetry: onTapRetry) : widget),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.primary,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.grey200),
      ),
    );
  }
}

class EmptyPageView extends StatelessWidget {
  const EmptyPageView({super.key, this.title, this.onTapRetry, this.height});
  final String? title;
  final Function()? onTapRetry;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height,
      width: double.infinity,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: '$title ${AppStrings.notAvailable}',
            weight: FontWeight.w600,
            size: 15.sp,
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: 10.h,
          ),
          // Retry Btn
          CustomButton(
            title: AppStrings.retry,
            isLoading: false,
            onPressed: onTapRetry ?? () {},
            width: 120.w,
            height: 40.h,
          ),
        ],
      ),
    );
  }
}

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({super.key, required this.isLoading});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            height: 50, width: double.infinity,
            margin: EdgeInsets.only(bottom: 20.h),
            // color: Colors.red,
            child: const Center(
                child: CircularProgressIndicator(
              color: AppColors.grey200,
            )),
          )
        : const SizedBox.shrink();
  }
}

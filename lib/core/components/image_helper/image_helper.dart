import '../../router/export.dart';

class ImageHelper extends StatelessWidget {
  final String image;
  final int? cacheSize;
  final BoxFit fit;
  final Alignment? alignment;
  final double? height;
  final double? width;
  final bool? isFileImage;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final bool? isStoreInCache;
  final Color? bgColor;

  const ImageHelper(
      {super.key,
      required this.image,
      this.bgColor,
      this.cacheSize,
      required this.fit,
      this.alignment,
      this.height,
      this.width,
      this.isFileImage,
      this.loadingWidget,
      this.errorWidget,
      this.isStoreInCache});

  Future<String>? imageUrl() async {
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageUrl(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        Widget child2;
        if (snapshot.hasData) {
          child2 = isFileImage != true
              ? isStoreInCache == true
                  ? CachedNetworkImage(
                      imageUrl: snapshot.data ?? "",
                      fit: fit,
                      alignment: alignment ?? Alignment.topCenter,
                      width: width ?? MediaQuery.of(context).size.width,
                      placeholder: (context, url) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: CircularProgressIndicator(
                              color: AppColors.grey200,
                            ),
                          ),
                        ],
                      ),
                      errorWidget: (context, url, error) => imageErrorWidget(bgColor: bgColor),
                    )
                  : Image.network(snapshot.data ?? "",
                      fit: fit,
                      alignment: alignment ?? Alignment.topCenter,
                      // height: height ?? MediaQuery.of(context).size.height,
                      width: width ?? MediaQuery.of(context).size.width,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.grey200,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ],
                        );
                      },
                      cacheHeight: cacheSize ?? 1800,
                      cacheWidth: cacheSize ?? 1800,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return imageErrorWidget(bgColor: bgColor);
                      })
              : Image.file(File(snapshot.data ?? ""),
                  fit: fit,
                  alignment: alignment ?? Alignment.topCenter,
                  height: height ?? MediaQuery.of(context).size.height,
                  width: width ?? MediaQuery.of(context).size.width,
                  cacheHeight: cacheSize ?? MediaQuery.of(context).size.longestSide.toInt(),
                  cacheWidth: cacheSize ?? MediaQuery.of(context).size.longestSide.toInt(),
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return imageErrorWidget(bgColor: bgColor);
                });
        } else if (snapshot.hasError) {
          child2 = errorWidget ?? imageErrorWidget(bgColor: bgColor);
        } else {
          child2 = loadingWidget ?? imageErrorWidget(bgColor: bgColor);
        }
        return child2;
      },
    );
  }

  Widget imageErrorWidget({Color? bgColor}) {
    return Container(
      padding: EdgeInsets.all(8.h),
      color: bgColor ?? AppColors.primary,
      // child: const TextWidget(
      //     text: ApiMsgStrings.imageNotAvailable
      // ),
    );
  }
}

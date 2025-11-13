import '../router/export.dart';

class AdaptiveLoader extends StatelessWidget {
  final Color? color;
  final double? size;

  const AdaptiveLoader({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        child: Platform.isIOS
            ? CupertinoActivityIndicator(color: color ?? AppColors.primary)
            : SizedBox(
                height: size, width: size, child: CircularProgressIndicator(color: color ?? AppColors.primary)),
      ),
    );
  }
}

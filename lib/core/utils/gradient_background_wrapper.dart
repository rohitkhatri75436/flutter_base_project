import '../router/export.dart';

class GradientBackgroundWrapper extends StatelessWidget {
  final Widget child;

  const GradientBackgroundWrapper({
    super.key,
    required this.child,
  });

  static LinearGradient firstScreenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x30000000), // Black with 20% opacity
      Color(0x30FFB02D), // Orange with 20% opacity
      Color(0x304085FF), // Blue with 20% opacity
      Color(0x30D9FFA3), // Light Green with 20% opacity
      Color(0x30EC5D1F), // Orange with 20% opacity
      Color(0x30000000), // Black with 20% opacity
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: firstScreenGradient),
      child: child,
    );
  }
}

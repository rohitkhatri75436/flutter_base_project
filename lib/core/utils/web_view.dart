import '../router/export.dart';

class CommonWebView extends StatefulWidget {
  static const String id = '/commonWebView';

  final String url;
  final String title;

  const CommonWebView({super.key, required this.url, required this.title});

  @override
  State<CommonWebView> createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        centerTitle: true,
        bgColor: AppColors.primary,
        titleStyle: FontStyles.headline6.copyWith(color: AppColors.white),
        backIconColor: AppColors.white,
        showBackPress: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

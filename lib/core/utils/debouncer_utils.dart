import 'dart:async';
import 'dart:ui';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void call(VoidCallback action) {
    if (_timer?.isActive ?? false) return;
    _timer = Timer(delay, () {});
    action();
  }
}

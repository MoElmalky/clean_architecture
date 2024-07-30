import 'dart:async';
import 'dart:ui';

class Debouncer {
  final Duration duration;
  Timer? _timer;
  String? oldQuery;

  Debouncer({required this.duration});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void runQ(VoidCallback action,String query){
    //Out of reach
    if(oldQuery != query){
      _timer?.cancel();
      oldQuery = query;
    }
    _timer = Timer(duration, action);
  }
}
import 'package:flutter/foundation.dart';
import 'dart:async';

// An observable object that stops timer when observation count reaches 0
// And restarts timer when observation count becomes > 0
class TimerValueNotifier extends ValueNotifier<int> {
  TimerValueNotifier(): super(0);

  // Since Dart is Single-threaded, this is safe
  // But in threaded languages, another idea should be followed.
  int observeCount = 0;

  Timer _timer;

  @override
  void addListener(VoidCallback listener) {
    observeCount++;
    super.addListener(listener);

    // In multithreaded languages, like Java/Kotlin/Swift/ObjC this is ERROR PRONE
    // use atomics in those languages. Or strict observation on the main thread only
    // like LiveData of Android.
    if(observeCount == 1) {
      _timer = new Timer.periodic(new Duration(seconds: 1), (Timer t){ this.value += 1; });
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    observeCount--;

    if(observeCount == 0) {
      if (_timer != null) { _timer.cancel(); }
    }
  }
}

class SingleOneModel {
  ValueNotifier<String> text = new ValueNotifier("");
  ValueNotifier<int> timer = new TimerValueNotifier();
}

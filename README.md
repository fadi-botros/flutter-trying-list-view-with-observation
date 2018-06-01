# flutter_trying_list_view_with_observation

This is a demo small application that demonstrate the use of a ListView (like Android's
RecyclerView), to observe on about 1000 timers, **where timers stop when there is no
observers on it**.

This is an introduction, so that we could apply MVVM architecture later on.
MVVM is mainly about observation.

## What this example demonstrate:

 - **ListView**
 - **CardView**
 - How to make a view observe on a model in Flutter (the approach here may not be the best
 but for more info, refer to [Flutter documentation about didUpdateWidget method in State class](https://docs.flutter.io/flutter/widgets/State/didUpdateWidget.html))

## Next Steps

 - Link something like this with something realtime, like Firebase.
 - Play with asyncs and Isolates for this reason.
 - Use `FutureBuilder` and `StreamBuilder`, which are extremely useful Widgets that could
 wrap other Widgets so that it rebuilds itself when `Future` or `Stream` yields new values.
 For more info: [Async Widgets](https://flutter.io/widgets/async/)
 - Improve the design.
 - Multiple screens, navigations, action bars, etc...
 - Use Clean Architecture and some more abstractions, like:
   * The observable that have counts, could be abstracted to something like LiveData of Android.
   * The timers, could be returned from a repository, which is an interface, so that could be implemented in a different way and tested.
   * The observer cell itself, could be abstracted made like `FutureBuilder` and `StreamBuilder`.

## Getting Started

For help getting started with Flutter, view online
[documentation](https://flutter.io/).

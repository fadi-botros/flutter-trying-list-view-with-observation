import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'singlemodel.dart';

// This cell is bound to a model, so take the model as a parameter
// Already the state will observe on it (the code for state will follow)
class TheCell extends StatefulWidget {
  final SingleOneModel model;

  TheCell({@required SingleOneModel model}): model = model;

  @override
  State createState() => new SingleOne();
}

// This state object, will just subscribe to the model bound to the widget
class SingleOne extends State<TheCell> {

  // Currently bound model
  SingleOneModel _model;

  // The functions that are put as listeners
  dynamic listenerToText;
  dynamic listenerToTimer;

  // Private helper functions for subscription and unsubscription

  void _unsubscribe(SingleOneModel model) {
    model.text.removeListener(listenerToText);
    model.timer.removeListener(listenerToTimer);
  }

  void _subscribe(SingleOneModel model) {
    _model = model;
    listenerToText = () {setState((){});};
    listenerToTimer = () {setState((){});};
    model.text.addListener(listenerToText);
    model.timer.addListener(listenerToTimer);
  }

  // The state object is now installed on a new widget
  @override
  void didUpdateWidget(TheCell oldWidget) {
    _unsubscribe(oldWidget.model);
    super.didUpdateWidget(oldWidget);
    _subscribe(widget.model);
  }

  // A new state object is created for a widget
  @override
  void initState() {
    super.initState();
    _subscribe(widget.model);
  }

  @override
  void dispose() {
    _unsubscribe(widget.model);
    super.dispose();
  }

  // UI function
  @override
  Widget build(BuildContext context) {
    return new Card(child: new Row(children: [
      // Dart seem to supports nullables, like Kotlin, but with a syntax like Swift
      // ?? is Swift style.
      // But the concept, is like Kotlin, there is no wrapper Optional object
      new Text(_model?.text?.value ?? ""),
      new SizedBox(width: 64.0),
      new Text("${_model?.timer?.value ?? 0}")
    ]));
  }
}
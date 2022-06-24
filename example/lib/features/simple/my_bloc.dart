import 'dart:async';

import 'package:example/features/simple/my_event.dart';
import 'package:example/features/simple/my_state.dart';
import 'package:template_package/template_package.dart';

class MyBloc extends TemplateBloc {
  /// create your custom streamController which will be listened by a unique widget inside your BaseWidget
  final StreamController myDataStateController = StreamController<MyCustomDataState>();

  MyBloc(BaseAnalytics analytics) : super(analytics) {
    // IMPORTANT to register your custom controllers here otherwise you will get a FlutterError
    registerStreams([
      myDataStateController.stream,
      // someOtherController.stream
    ]);
    init();
  }

  init() {
    myDataStateController.add(MyCustomDataState(myCustomData: "initial data from bloc"));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    /// Any event sent by our base widget will end up here
    /// Make sure you filter them by exact type (the Event needs to extend BaseBlocEvent)
    if (event is MyCustomEvent) {
      callMethodThatWillDoSomething(event.dataFromUi ?? 'no data');
    } else if (event is MyButtonTapCustomEvent) {
      doSomethingOnButtonTap(event.dataFromUi);
    }
  }

  void doSomethingOnButtonTap(String dataFromUi) {
    print(dataFromUi);
    myDataStateController.add(MyCustomDataState(myCustomData: "$dataFromUi with my custom data"));
  }

  void callMethodThatWillDoSomething(String dataFromUi) {
    // todo do something
  }

  @override
  void dispose() {
    // dispose your controllers here
    myDataStateController.close();
    super.dispose();
  }
}

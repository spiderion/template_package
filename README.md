# template_package

A template package for flutter apps.

This package will give you a set of tools to speed up and keep clean the development of your app.

- State Management
- Manages the flutter state in a similar but more flexible way then the common flutter bloc
- UseCase interface to implement and organize the application logic of your app
- LoggerDefault to log all your required logs
- Flutter toasts are few of the utilities already incorporated.
- BaseBlocDataState , BaseBlocPrimaryState states and BaseBlocEvent to organize the flow of data
  between your widget and bloc

| Features | Modules |
| ------ | ------ |
| State management | BaseWidget and TemplateBloc |
| Navigation | BaseBlocPrimaryState and sinkState |
| Logs | LoggerDefault |
| business rules modules | ABR EBR |
| dependency injection | BaseDependencyModule |

# Getting Started

## State Management

https://www.youtube.com/watch?v=31tItITkkEs

#### Convert the widget

Let's start by converting your StatefullWidget in a widget that accepts states from the bloc (
TemplateBloc)

Extend your stateFull widget with BaseWidget and your state class with BaseState also add an extra
generic type in the <PageName, **BaseBloc**>

```dart
class MyWidget extends BaseWidget {
  MyWidget(BaseBloc Function() getBloc) : super(getBloc);

```

```dart
class _MyWidgetState extends BaseState<MyWidget, BaseBloc> {
```

complete and simple widget example

```dart
import 'package:example/features/simple/my_event.dart';
import 'package:example/features/simple/my_state.dart';
import 'package:flutter/material.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

class MyWidget extends BaseWidget {
  MyWidget(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends BaseState<MyWidget, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: myWidgetListener(),
    );
  }


  // Note the streamBuilder listening the events from **MyCustomDataState** Stream
  Widget myWidgetListener() {
    return StreamBuilder(
        stream: bloc.getStreamOfType<MyCustomDataState>(),
        builder: (BuildContext context, AsyncSnapshot<MyCustomDataState> snapshot) {
          if (snapshot.data == null)
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('no data received'),
                  ],
                ));
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data?.myCustomData ?? ''),
                  SizedBox(height: 10),
                  sendDataToBlocButton(),
                ],
              ));
        });
  }

  ElevatedButton sendDataToBlocButton() {
    return ElevatedButton(
        onPressed: () {
          bloc.event.add(MyButtonTapCustomEvent('myAnalyticEvent', dataFromUi: "data from UI"));
        },
        child: Text('Send Data To Bloc'));
  }
}



```

#### Create the bloc

```dart
import 'dart:async';

import 'package:example/features/initial/initial_event.dart';
import 'package:example/features/initial/initial_state.dart';
import 'package:template_package/template_package.dart';

class MyBloc extends BaseBloc {
  /// create your custom streamController which will be listened by a unique widget inside your BaseWidget
  final StreamController myDataStateController = StreamController<MyCustomDataState>();

  MyBloc() {
    // IMPORTANT to register your custom controllers here otherwise you will get a FlutterError
    registerStreams([
      myDataStateController.stream,
      // someOtherController.stream
    ]);
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    /// Any event sent by our base widget will end up here
    /// Make sure you filter them by exact type (the Event needs to extend BaseBlocEvent)
    if (event is MyCustomEvent) {
      callMethodThatWillDoSomething(event.dataFromUi);
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



```

#### create a file for your DataStates and create your dataStates

```dart
class MyCustomDataState extends BaseBlocDataState {
  final String myCustomData;

  MyCustomDataState({required this.myCustomData});
}

```

#### create a file for your Events and create your baseBlocEvents

```dart
class MyCustomEvent extends BaseBlocEvent {
  final String myCustomDataFromUi;

  MyCustomEvent(String? analyticEventName, this.myCustomDataFromUi) : super(analyticEventName);
}


```

Here is an overview of how the comunication between these elements will work

![Alt text](readme_images/state_management.png?raw=true "State Management")

#### lets see how we compose these dependencies

```dart 

 /// if you don't have a custom analytics you can use a default one AnalyticsProxy()
 /// The params passed in the constructor of the Bloc are very custom and with no limitations like getIt
 final page = MyWidget(() => MyBloc(AnalyticsProxy([], enable: false)));
 ```

## Navigation

https://www.youtube.com/watch?v=31tItITkkEs

#### Navigation class

```dart
class NavigateToMyPage extends BaseBlocPrimaryState {
  final Function(dynamic result)? onPop;
  final String variable;

  NavigateToMyPage({this.onPop, required this.variable, bool rootNavigator = true}) : super();

  @override
  call(context) {
    final page = MyWidget(() => MyBloc(AnalyticsProxy([], enable: false)));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page)).then((value) {
      return onPop?.call(value);
    });
  }
}

```

#### How to navigate from a widget

```dart
 void methodInMyWidget(BuildContext context) {
  NavigateToMyPage(params).call(context);
}
```

#### How to navigate from a bloc

```dart
 void methodInMyBloc() {
  sinkState?.add(NavigateToMyPage(params));
}
```

### Architecture

![Alt text](readme_images/architecture.png?raw=true "Architecture")


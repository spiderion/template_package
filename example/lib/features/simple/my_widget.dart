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

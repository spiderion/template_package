import 'package:example/features/simple/my_bloc.dart';
import 'package:example/features/simple/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:template_package/template_package.dart';

class NavigateToMyPage extends BaseBlocPrimaryState {
  final Function(dynamic result)? onPop;
  final String variable;

  NavigateToMyPage({this.onPop, required this.variable, bool rootNavigator = true}) : super();

  @override
  call(context) {
    final page = MyWidget(() => MyBloc());
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page)).then((value) {
      return onPop?.call(value);
    });
  }
}

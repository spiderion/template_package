import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:template_package/template_package.dart';

class MessageInfoState extends BaseBlocPrimaryState {
  final String? message;
  final String? elementNameMessage;
  final ToastGravity? toastGravity;
  final Toast? length;
  final Color? color;
  final Color? textColor;

  MessageInfoState(this.message,
      {this.textColor, this.elementNameMessage, this.toastGravity, this.length, this.color});

  @override
  call(param) {
    Fluttertoast.showToast(
        msg: "${elementNameMessage ?? ""} ${Translations.of(param)!.text(message)}",
        backgroundColor: color ?? Theme.of(param).colorScheme.secondary,
        textColor: color ?? Theme.of(param).colorScheme.onSecondary,
        toastLength: length ?? Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.CENTER);
  }
}

class ContinueState extends BaseBlocPrimaryState {
  @override
  void call(BuildContext param) {}
}

class PopPageState extends BaseBlocPrimaryState {
  final dynamic returnedParam;
  int? popTimes;
  bool rootNavigator;

  PopPageState({this.returnedParam, this.popTimes, this.rootNavigator = false});

  @override
  void call(param) {
    if (popTimes != null) {
      for (var i = 0; i <= popTimes!; i++) {
        Navigator.of(param, rootNavigator: rootNavigator).pop(returnedParam);
      }
    } else {
      Navigator.of(param, rootNavigator: rootNavigator).pop(returnedParam);
    }
  }
}

class MaybePopState extends BaseBlocPrimaryState {
  final result;
  bool rootNavigator;

  MaybePopState({this.result, this.rootNavigator = false});

  @override
  call(param) {
    Navigator.of(param, rootNavigator: rootNavigator).maybePop(result);
  }
}

class CloseKeyBoard extends BaseBlocPrimaryState {
  CloseKeyBoard();

  @override
  call(param) {
    FocusScopeNode currentFocus = FocusScope.of(param);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

class EndProgressState extends BaseBlocPrimaryState {
  final bool rootNavigator;

  EndProgressState({this.rootNavigator = true});

  @override
  call(param) {
    Navigator.of(param, rootNavigator: rootNavigator).maybePop();
  }
}

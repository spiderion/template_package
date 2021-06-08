import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:template_package/template_package.dart';

class MessageInfoState extends BaseBlocPrimaryState {
  final String? message;
  final String? elementNameMessage;
  final ToastGravity? toastGravity;
  final Toast? length;
  final Color? color;

  MessageInfoState(this.message, {this.elementNameMessage, this.toastGravity, this.length, this.color});

  @override
  call(param) {
    if (param is BuildContext) {
      Fluttertoast.showToast(
          msg: "${elementNameMessage ?? ""} ${Translations.of(param)!.text(message)}",
          backgroundColor: color ?? Theme.of(param).colorScheme.primary,
          toastLength: length ?? Toast.LENGTH_LONG,
          gravity: toastGravity ?? ToastGravity.BOTTOM);
    }
  }
}

class ContinueState extends BaseBlocPrimaryState {
  @override
  void call(BuildContext param) {}
}

class PopPageState extends BaseBlocPrimaryState {
  final dynamic returnedParam;
  int? popTimes;

  PopPageState({this.returnedParam, this.popTimes});

  @override
  void call(param) {
    if (param is BuildContext) {
      if (popTimes != null) {
        for (var i = 0; i <= popTimes!; i++) {
          Navigator.of(param).pop(returnedParam);
        }
      } else {
        Navigator.of(param).pop(returnedParam);
      }
    }
  }
}

class MaybePopState extends BaseBlocPrimaryState {
  final result;

  MaybePopState({this.result});

  @override
  call(param) {
    Navigator.of(param).maybePop(result);
  }
}

class CloseKeyBoard extends BaseBlocPrimaryState {
  CloseKeyBoard();

  @override
  call(param) {
    if (param is BuildContext) {
      FocusScopeNode currentFocus = FocusScope.of(param);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
  }
}
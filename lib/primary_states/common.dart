import 'package:flutter/material.dart';
import 'package:template_package/template_package.dart';

/// Use this state to show a message on your UI
/// Used from a BaseBlocImpl by calling sinkState?.add(MessageInfoState('message'))
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
        textColor: textColor ?? Theme.of(param).colorScheme.onSecondary,
        toastLength: length ?? Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.CENTER);
  }
}

class ContinueState extends BaseBlocPrimaryState {
  @override
  void call(BuildContext param) {}
}

class MessageSnackBarState extends BaseBlocPrimaryState {
  final String? message;
  final String? elementNameMessage;
  final Color? color;
  final Color? textColor;

  MessageSnackBarState(this.message, {this.textColor, this.elementNameMessage, this.color});

  @override
  call(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        Translations.of(context)?.text(message ?? '') ?? '',
        style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      backgroundColor: color ?? Theme.of(context).colorScheme.secondaryContainer,
    ));
  }
}

/// Useful state to pop a page directly from your bloc
/// Just call sinkState?.add(PopPageState());
class PopPageState extends BaseBlocPrimaryState {
  final dynamic returnedParam;
  int? popTimes;
  bool rootNavigator;

  PopPageState({this.returnedParam, this.popTimes, this.rootNavigator = false});

  @override
  void call(param) {
    final navigator = Navigator.of(param, rootNavigator: rootNavigator);
    if (popTimes != null) {
      for (var i = 0; i <= popTimes!; i++) {
        if (navigator.canPop()) navigator.pop(returnedParam);
      }
    } else {
      navigator.pop(returnedParam);
    }
  }
}

/// A much softer way of popping a page
/// Used from a TemplateBlocImpl by calling sinkState?.add(MaybePopState());
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

/// Call this when you want to stop showing a progress state initiated by a StartProgressState
class EndProgressState extends BaseBlocPrimaryState {
  final bool rootNavigator;

  EndProgressState({this.rootNavigator = true});

  @override
  call(param) {
    Navigator.of(param, rootNavigator: rootNavigator).maybePop();
  }
}

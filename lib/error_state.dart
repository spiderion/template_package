import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:template_package/locale/translations.dart';
import 'package:template_package/template_package.dart';

abstract class AbstractErrorState extends BaseBlocPrimaryState {
  final Error error;

  AbstractErrorState(this.error);

  @override
  void call(BuildContext context);
}

class ErrorState extends AbstractErrorState {
  ErrorState({required Error error}) : super(error);

  @override
  call(param) {
    if (param is BuildContext) {
      Fluttertoast.showToast(
          msg: Translations.of(param)!.text(error.message),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Theme.of(param).errorColor,
          gravity: ToastGravity.CENTER);
    }
  }
}

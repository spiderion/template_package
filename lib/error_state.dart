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

  String translate(BuildContext context, String key) => Translations.of(context)!.text(key);
}

class ErrorState extends AbstractErrorState {
  ErrorState({required Error error}) : super(error);

  @override
  call(BuildContext context) {
    if (context is BuildContext) {
      Fluttertoast.showToast(
          msg: translate(context, error.message ?? ''),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Theme.of(context).errorColor,
          gravity: ToastGravity.CENTER);
    }
  }
}

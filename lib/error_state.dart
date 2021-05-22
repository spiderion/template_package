import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:template_package/template_package.dart';
import 'package:template_package/locale/translations.dart';

class ErrorState extends BaseBlocPrimaryState {
  final String? message;

  ErrorState({required this.message});

  @override
  call(param) {
    if (param is BuildContext) {
      Fluttertoast.showToast(
          msg: Translations.of(param)!.text(message),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Theme.of(param).errorColor,
          gravity: ToastGravity.CENTER);
    }
  }
}

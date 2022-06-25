import 'package:flutter/material.dart';
import 'package:template_package/template_package.dart';

/// Extend this class to create your custom error
abstract class AbstractErrorState extends BaseBlocPrimaryState {
  final Error error;

  AbstractErrorState(this.error);

  /// This method is called by the BaseWidget when sinkState?.add(YourState) is called
  @override
  void call(BuildContext context);

  String translate(BuildContext context, String key) => Translations.of(context)!.text(key);
}

/// A default error message to call from your bloc sinkState?.add(ErrorState(Error()));
class ErrorState extends AbstractErrorState {
  ErrorState({required Error error}) : super(error);

  @override
  call(BuildContext context) {
    Fluttertoast.showToast(
        msg: translate(context, error.message ?? ''),
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Theme.of(context).errorColor,
        gravity: ToastGravity.CENTER);
  }
}

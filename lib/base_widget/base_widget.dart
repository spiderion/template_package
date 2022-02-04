import 'package:base_bloc/bloc/base_bloc.dart';
import 'package:base_bloc/bloc/primary_state.dart';
import 'package:flutter/material.dart';
import 'package:template_package/locale/translations.dart';

abstract class BaseWidget extends StatefulWidget {
  final BaseBloc Function() getBloc;

  BaseWidget(this.getBloc, {Key? key}) : super(key: key);
}

abstract class BaseState<PageType extends BaseWidget, BlocType extends BaseBloc> extends State<PageType> {
  late BlocType bloc;

  NavigatorState get navigator => Navigator.of(context);

  @override
  void initState() {
    bloc = widget.getBloc() as BlocType;
    bloc.baseState.listen(onBlocStateChanged);
    super.initState();
  }

  String translate(String? text, {BuildContext? context, Map<String, String?>? arguments}) {
    return Translations.of(context ?? this.context)?.text(text, arguments) ?? "";
  }

  @mustCallSuper
  void onBlocStateChanged(BaseBlocPrimaryState state) => state.call(context);

  @protected
  @mustCallSuper
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

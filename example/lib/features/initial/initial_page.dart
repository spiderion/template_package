import 'package:flutter/material.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

import 'initial_event.dart';
import 'initial_state.dart';

class InitialPage extends BaseWidget {
  InitialPage(TemplateBloc Function() getBloc, {Key? key}) : super(getBloc, key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

/// Notice that your Widget doesn't know the concrete class of the bloc only the abstract class [BaseBloc]
class _InitialPageState extends BaseState<InitialPage, BaseBloc> {
  @override
  Widget build(BuildContext context) => mainWidget();

  Widget mainWidget() {
    return StreamBuilder<InitialDataState>(
        /// Receive events from the bloc by listening to your DataStateControllers in the bloc
        stream: bloc.getStreamOfType<InitialDataState>(),
        builder: (BuildContext context, AsyncSnapshot<InitialDataState> snapshot) {
          return Scaffold(
              floatingActionButton: saveButton(),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              appBar: AppBar(centerTitle: true, title: Text(snapshot.data?.appName ?? "")),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomWidget(snapshot.data?.isHorizontalStyle ?? false),
                  const SizedBox(height: 50),
                  Text('${translate('app_package')}:\n ${snapshot.data?.appPackage ?? ''}'),
                  const SizedBox(height: 20),
                  Text('${translate('app_name')}:\n ${snapshot.data?.appName ?? ''}'),
                  const SizedBox(height: 20),
                  Text('${translate('app_version')}:\n ${snapshot.data?.appVersion ?? ''}'),
                ],
              )));
        });
  }

  Widget saveButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  /// send events to your bloc
                  bloc.event.add(SaveDataEvent('analytic_event_name_set', 'some data'));
                },
                child: Text(translate('save_data'))),
            ElevatedButton(
                onPressed: () {
                  bloc.event.add(GetDataEvent('analytic_event_name_get'));
                },
                child: Text(translate('get_data'))),
          ],
        ),
      ),
    );
  }

  Widget getCustomWidget(bool isHorizontalStyle) {
    return FlutterLogo(
      size: isHorizontalStyle
          ? MediaQuery.of(context).size.width * 0.8
          : MediaQuery.of(context).size.width * 0.5,
      duration: const Duration(seconds: 3),
      style: isHorizontalStyle == true ? FlutterLogoStyle.horizontal : FlutterLogoStyle.markOnly,
    );
  }
}

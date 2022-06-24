import 'dart:async';

import 'package:example/navigation/navigate_to_simple_page.dart';
import 'package:template_package/error_state.dart';
import 'package:template_package/primary_states/common.dart';
import 'package:template_package/template_package.dart';

import '../../core/models/some_model.dart';
import '../../core/states/primary_states/error_states/error_full_screen.dart';
import '../../core/use_cases/user_use_case.dart';
import 'initial_event.dart';
import 'initial_state.dart';

class InitialBloc extends TemplateBloc {
  /// Notice the useCases are injected into the constructors
  final SomeUseCase someUseCase;

  /// Use the dataState streamControllers to update small portions of your UI by
  /// listening Using streamBuilders
  final StreamController initialDataStateController = StreamController<InitialDataState>();

  InitialBloc(BaseAnalytics analytics, this.someUseCase) : super(analytics) {
    /// in each bloc make sure you register all you DataStateControllers
    registerStreams([initialDataStateController.stream]);
    init();
  }

  void init() async {
    initialDataStateController.sink.add(InitialDataState(
      text: 'Initial data:',
      appName: 'example app name',
      appPackage: "packageName",
      appVersion: 'version 1.0.0',
    ));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is SaveDataEvent) {
      saveData(event.data);
    } else if (event is GetDataEvent) {
      fetchData();
    } else if (event is OnNavigateTapEvent) {
      onNavigateTap();
    }
  }

  void onNavigateTap() {
    sinkState?.add(NavigateToMyPage(
        onPop: (result) {
          Fluttertoast.showToast(msg: 'page popped', gravity: ToastGravity.TOP);
          print('page popped');
        },
        variable: 'myVar'));
  }

  void fetchData() {
    someUseCase.getSomeData(RequestObserver(onListen: (SomeModel? someModel) {
      initialDataStateController.sink.add(InitialDataState(
          text: 'from database:',
          appName: "_packageInfo.appName",
          appVersion: "_packageInfo.version",
          appPackage: "_packageInfo.packageName",
          someData: someModel?.someData.toUpperCase() ?? "",
          isHorizontalStyle: true));
      sinkState?.add(MessageInfoState("success"));
    }, onError: (Error e) {
      sinkState?.add(ErrorFullScreenState(
          error: e,
          onCtaTap: () {
            sinkState?.add(MaybePopState());
          }));
    }));
  }

  void saveData(String data) {
    final someModel = SomeModel('some data');
    someUseCase.setSomeData(RequestObserver(
        requestData: someModel,
        onListen: (_) => sinkState?.add(MessageInfoState("saved")),
        onError: (e) => sinkState?.add(ErrorState(error: e))));
  }

  @override
  void dispose() {
    /// close all your dataStateControllers
    initialDataStateController.close();
    super.dispose();
  }
}

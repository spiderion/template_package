import 'package:flutter/material.dart';

import 'app.dart';
import 'dependency/dependency_module.dart';

void main() {
  /// Initialize all your modules
  final dependencyModule = DependencyModule();
  final subModules = dependencyModule.getReadySubModules();
  /// Run the app with all the modules already created
  runApp(App(subModules));
}

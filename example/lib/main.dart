import 'package:flutter/material.dart';

import 'app.dart';
import 'dependency/dependency_module.dart';

void main() {
  final dependencyModule = DependencyModule();
  final subModules = dependencyModule.getReadySubModules();
  runApp(App(subModules));
}

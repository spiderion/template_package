import 'package:template_package/template_package.dart';

import '../models/some_model.dart';
import '../repositories/initial_repository.dart';

class SomeUseCase extends UseCase<InitialRepository> {
  SomeUseCase(InitialRepository repository) : super(repository);

  Future<void> getSomeData(RequestObserver<dynamic, SomeModel?> requestBehaviour) async {
    await repository.getSomeData(RequestObserver<dynamic, SomeModel?>(
        onListen: (SomeModel? data) {
          requestBehaviour.onListen?.call(data);
        },
        onError: requestBehaviour.onError));
  }

  Future<void> setSomeData(RequestObserver<SomeModel?, dynamic> requestBehaviour) async {
    await repository.setSomeData(RequestObserver<SomeModel?, dynamic>(
        requestData: requestBehaviour.requestData,
        onListen: (_) {
          requestBehaviour.onListen?.call(_);
        },
        onError: requestBehaviour.onError));
  }
}

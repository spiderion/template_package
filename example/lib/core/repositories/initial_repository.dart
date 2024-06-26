import 'package:template_package/template_package.dart';

import '../data/dao.dart';
import '../models/some_model.dart';

class InitialRepository extends BaseRepository {
  final Dao _dao;

  InitialRepository(RemoteConfiguration remoteConfiguration, this._dao) : super(remoteConfiguration);

  Future<void> getSomeData(RequestObserver<dynamic, SomeModel?> requestBehaviour) async {
    try {
      final result = await _dao.getSomeData();
      requestBehaviour.onListen?.call(SomeModel.fromJson(result));
    } catch (e) {
      requestBehaviour.onError?.call(ServerError(message: e.toString()));
      requestBehaviour.onDone?.call();
    }
  }

  Future<void> setSomeData(RequestObserver<SomeModel?, dynamic> requestBehaviour) async {
    try {
      final result = await _dao.setSomeData(requestBehaviour.requestData!.toJson());
      requestBehaviour.onListen?.call(result);
    } catch (e) {
      requestBehaviour.onError?.call(ServerError(message: e.toString()));
      requestBehaviour.onDone?.call();
    }
  }
}

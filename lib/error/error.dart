import 'package:equatable/equatable.dart';
import 'package:template_package/request_and_response_model/result_model.dart';

///This is the final error returned from the [UseCase] which will be
///handled by an [ErrorStateResolver]
abstract class Error extends Equatable implements ResultModel {
  final String? message;

  Error({this.message = "ERROR_SOMETHING_WENT_WRONG"});

  @override
  List<Object?> get props => [message];
}

class ServerError extends Error {
  ServerError({String? message}) : super(message: message);
}

class CacheError extends Error {
  CacheError({String? message}) : super(message: message);
}

class NotConnectedError extends Error {
  NotConnectedError({String message = "ERROR_NETWORK_CONNECTION"}) : super(message: message);
}

class BusinessError extends Error {
  BusinessError({String message = "SOMETHING_MIGHT_NOT_BE_CORRECT"}) : super(message: message);
}

class NotSignedInError extends Error {
  NotSignedInError({String message = "NOT_SIGNED_IN_ERROR"}) : super(message: message);
}

class PermissionError extends Error {
  PermissionError({String message = "PERMISSION_TO_USE_THIS_FEATURE_ARE_NOT_GRANTED"}) : super(message: message);
}

class FirstTimePermissionError extends Error {
  FirstTimePermissionError({String message = "PERMISSION_TO_USE_THIS_FEATURE_ARE_NOT_GRANTED"})
      : super(message: message);
}

class CaseNotFoundError extends Error {
  CaseNotFoundError({String message = "DEVELOPER_ERROR"}) : super(message: message);
}

class UnimplementedError extends Error {
  UnimplementedError({String message = "UNIMPLEMENTED_ERROR"}) : super(message: message);
}

class AddressNotFoundError extends Error {
  AddressNotFoundError({final String message = "ADDRESS_NOT_FOUNT_ERROR"}) : super(message: message);
}

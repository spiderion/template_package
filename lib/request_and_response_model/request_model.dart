abstract class RequestModel {}

class RequestConfigString extends RequestModel {
  final String keyStringRequested;

  RequestConfigString(this.keyStringRequested);
}

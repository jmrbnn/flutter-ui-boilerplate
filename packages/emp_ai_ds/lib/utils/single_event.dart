class SingleEvent<T> {
  SingleEvent({required Function(T? param) invoke}) : _invoke = invoke;

  final Function(T? param) _invoke;

  void invokeWith(T? param) {
    _invoke(param);
  }

  void invoke() {
    _invoke(null);
  }
}

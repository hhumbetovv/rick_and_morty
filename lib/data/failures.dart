class Failure {
  final String? _message;

  Failure([String? error, String? stack]) : _message = '$error => $stack';

  String? get message => _message;
}

class EntityFailure {
  final String? _message;

  EntityFailure([String? message]) : _message = message;

  String? get message => _message;
}

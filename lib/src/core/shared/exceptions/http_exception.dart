import 'package:dartz/dartz.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/domain/models/response.dart';
import 'package:equatable/equatable.dart';

class AppException implements Exception {
  final dynamic message;
  final int? statusCode;
  final String? identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });

  @override
  String toString() {
    String msg;
    if (message is List<dynamic>) {
      List<dynamic> message_ = message as List<dynamic>;
      msg = message_.join(' | ');
    } else {
      msg = message.toString();
    }

    return 'statusCode=$statusCode\nmessage=$msg\nidentifier=$identifier';
  }
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String? get identifier => 'Cache failure exception';

  @override
  String? get message => 'Unable to save user';

  @override
  int? get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

//  extension

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}

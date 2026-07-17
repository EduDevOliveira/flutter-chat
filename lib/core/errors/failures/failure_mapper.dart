import 'package:flutter_chat/core/errors/exceptions/app_exception.dart';
import 'package:flutter_chat/core/errors/messages/auth_error_messages.dart';
import 'app_failure.dart';

class FailureMapper {
  static AppFailure map(AppException exception) {
    return switch (exception) {
      AuthException(:final code) => AppFailure.auth(
        AuthErrorMessages.fromCode(code),
      ),

      FirestoreException(:final code) => AppFailure.firestore(code),

      NetworkException() => const AppFailure.network(
        'Sem conexão com a internet.',
      ),

      UnknownException(:final message) => AppFailure.unknown(
        message ?? 'Ocorreu um erro inesperado.',
      ),
    };
  }
}

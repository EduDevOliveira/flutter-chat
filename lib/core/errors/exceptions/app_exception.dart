import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
sealed class AppException with _$AppException implements Exception {
  const factory AppException.auth(String code) = AuthException;

  const factory AppException.firestore(String code) = FirestoreException;

  const factory AppException.network() = NetworkException;

  const factory AppException.unknown([String? message]) = UnknownException;
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
sealed class AppFailure with _$AppFailure {
  const factory AppFailure.auth(String message) = AuthFailure;

  const factory AppFailure.firestore(String message) = FirestoreFailure;

  const factory AppFailure.network(String message) = NetworkFailure;

  const factory AppFailure.unknown(String message) = UnknownFailure;
}
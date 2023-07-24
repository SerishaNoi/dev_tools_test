part of 'authorization_cubit.dart';

@freezed
class AuthorizationCubitState with _$AuthorizationCubitState {
  const factory AuthorizationCubitState.initial() = _Initial;
  const factory AuthorizationCubitState.loading() = _Loading;
  const factory AuthorizationCubitState.loggedIn(
      // UserCredential? userCredential,
      ) = _LoggedIn;
  const factory AuthorizationCubitState.error(
    String message,
  ) = _Error;
}

part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthValidateState extends AuthState {
  final bool _isValidateState;

  const AuthValidateState(this._isValidateState);
}

class AuthCompleted extends AuthState{
  const AuthCompleted();
}

class AuthErrorState extends AuthState{
  final String errorState;
  const AuthErrorState(this.errorState);
}

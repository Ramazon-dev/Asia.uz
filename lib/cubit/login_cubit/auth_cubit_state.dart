part of 'auth_cubit.dart';

@immutable
abstract class AuthState {

}

class AuthInitial extends AuthState {

}

class AuthValidateState extends AuthState {
  final bool _isValidateState;

  AuthValidateState(this._isValidateState);
}

class AuthCompleted extends AuthState{

}

class AuthErrorState extends AuthState{
  final String errorState;
  AuthErrorState(this.errorState);
}

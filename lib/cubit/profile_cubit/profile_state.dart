part of 'profile_cubit.dart';

@immutable
abstract class ProfileState{

}

class ProfileInitial extends ProfileState{

}

class ProfileLoading extends ProfileState{

}

class ProfileValidateState extends ProfileState{
  final bool isValidateState;
  ProfileValidateState(this.isValidateState);
}

class ProfileCompleted extends ProfileState{

}

class ProfileError extends ProfileState{
  final String erroeMessange;
  ProfileError(this.erroeMessange);
}
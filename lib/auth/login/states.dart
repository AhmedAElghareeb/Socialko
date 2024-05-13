part of 'bloc.dart';

class LoginStates {}

class LoadingState extends LoginStates {}

class SuccessState extends LoginStates
{
  final String uId;

  SuccessState(this.uId);
}

class FailedState extends LoginStates
{
  final String err;

  FailedState(this.err);
}

part of 'bloc.dart';

class RegisterStates {}

class LoadingState extends RegisterStates {}

class SuccessState extends RegisterStates {}

class FailedState extends RegisterStates
{
  final String err;

  FailedState(this.err);
}

class CreateSuccessState extends RegisterStates {}
class CreateFailedState extends RegisterStates
{
  final String err;

  CreateFailedState(this.err);
}

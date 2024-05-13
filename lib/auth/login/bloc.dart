import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'event.dart';

part 'states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<StartLoginEvent>(_login);
  }

  final email = TextEditingController();
  final password = TextEditingController();

  void _login(StartLoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoadingState());

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ).then((value)
    {
      emit(SuccessState(value.user!.uid));
    }).catchError((err) {
      emit(FailedState(
        err.toString()
      ));
    });
  }
}

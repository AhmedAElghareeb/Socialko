import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialko/utils/helper.dart';
import 'package:socialko/views/base/chats/view.dart';

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

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ).then((value) {
      CacheHelper.saveData(key: "uId", value: value.user!.uid);
      emit(SuccessState(value.user!.uid));
      pushAndRemoveUntil(const ChatsView(), arguments: email);
    }).catchError((err) {
      emit(FailedState(err.toString()));
    });
  }
}

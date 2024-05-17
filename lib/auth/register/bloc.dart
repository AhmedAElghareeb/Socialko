import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'model.dart';

part 'event.dart';

part 'states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(RegisterStates()) {
    on<StartRegisterEvent>(_register);
  }

  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final name = TextEditingController();

  void _register(StartRegisterEvent event, Emitter<RegisterStates> emit) async {
    emit(LoadingState());

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ).then((value) async {

      UserModel model = UserModel(
        name: name.text,
        email: email.text,
        phone: phone.text,
        uId: value.user!.uid,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(value.user!.uid)
          .set(model.toMap())
          .then((value) {
        emit(CreateSuccessState());
      }).catchError((err) {
        emit(CreateFailedState(err.toString()));
      });
    }).catchError((err) {
      emit(FailedState(err.toString()));
    });
  }
}

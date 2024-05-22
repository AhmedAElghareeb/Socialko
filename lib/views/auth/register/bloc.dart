import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialko/utils/helper.dart';
import 'package:socialko/views/base/chats/view.dart';

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
    )
        .then((value) async {
      UserModel model = UserModel(
        name: name.text,
        email: email.text,
        phone: phone.text,
        uId: value.user!.uid,
        image: "https://img.freepik.com/free-photo/man-presenting-something_1368-3697.jpg?t=st=1716206424~exp=1716210024~hmac=53f26695baf2abd8a34aa23e59e7bb5cb2d966ab497ebbabf4e30d162347b2fa&w=900",
        cover: "https://img.freepik.com/free-photo/man-with-thumb-up_1368-3701.jpg?t=st=1716206438~exp=1716210038~hmac=96613eb143d5a28ccc2f2a76dc5ec3b18151465e55218f50806f9d5348aaa426&w=1060",
        bio: "write your bio here ...",
      );
      CacheHelper.saveData(key: "uId", value: value.user!.uid);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(value.user!.uid)
          .set(model.toMap())
          .then((value) {
        emit(CreateSuccessState());
        pushAndRemoveUntil(const ChatsView(), arguments: email.text);
      }).catchError((err) {
        emit(CreateFailedState(err.toString()));
      });
    }).catchError((err) {
      emit(FailedState(err.toString()));
    });
  }
}

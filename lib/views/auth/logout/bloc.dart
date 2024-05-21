import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialko/utils/helper.dart';
import 'package:socialko/views/auth/login/view.dart';

part 'states.dart';

part 'event.dart';

class LogOutBloc extends Bloc<LogOutEvents, LogOutStates> {
  LogOutBloc() : super(LogOutStates()) {
    on<StartLogOutEvent>(_fun);
  }

  void _fun(StartLogOutEvent event, Emitter<LogOutStates> emit) async {
    emit(LoadingLogOutState());

    await FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.removeData(key: "uId");
      pushAndRemoveUntil(const LoginView());
      emit(SuccessLogOutState());
    }).catchError((err) {
      emit(FailedLogOutState());
    });
  }
}

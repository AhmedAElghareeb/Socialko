import 'package:kiwi/kiwi.dart';
import 'package:socialko/views/auth/login/bloc.dart';
import 'package:socialko/views/auth/logout/bloc.dart';
import 'package:socialko/views/auth/register/bloc.dart';

void serviceLocator() {
  KiwiContainer c = KiwiContainer();

  c.registerFactory((container) => LoginBloc());
  c.registerFactory((container) => RegisterBloc());
  c.registerFactory((container) => LogOutBloc());
}

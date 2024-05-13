import 'package:kiwi/kiwi.dart';
import 'package:socialko/auth/login/bloc.dart';
import 'package:socialko/auth/register/bloc.dart';

void serviceLocator() {
  KiwiContainer c = KiwiContainer();

  c.registerFactory((container) => LoginBloc());
  c.registerFactory((container) => RegisterBloc());
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialko/observer.dart';
import 'package:socialko/splash.dart';
import 'package:socialko/utils/helper.dart';
import 'package:socialko/utils/sl.dart';
import 'firebase_options.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  serviceLocator();

  CacheHelper.init();

  Bloc.observer = AppBlocObserver();

  await ScreenUtil.ensureScreenSize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const Socialko(),
  );
}

class Socialko extends StatelessWidget {
  const Socialko({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        400,
        850,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            platform: TargetPlatform.iOS,
            useMaterial3: false,
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                elevation: 0,
                backgroundColor: Colors.white)),
        home: const SplashView(),
      ),
    );
  }
}

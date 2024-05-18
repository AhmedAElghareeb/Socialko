import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialko/views/auth/login/view.dart';
import 'package:socialko/utils/helper.dart';
import 'package:socialko/views/base/home_nav.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        if(CacheHelper.getData(key: "uId").isNotEmpty) {
          pushAndRemoveUntil(
            const HomeNavView(),
          );
        } else
        {
          pushAndRemoveUntil(
            const LoginView(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BounceInDown(
          duration: const Duration(
            seconds: 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/logo.svg",
                width: double.infinity,
                height: 100.h,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Social Ko",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:socialko/views/auth/login/view.dart';
import 'package:socialko/views/auth/register/bloc.dart';
import 'package:socialko/utils/helper.dart';
import 'package:socialko/utils/widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final bloc = KiwiContainer().resolve<RegisterBloc>();

  final event = StartRegisterEvent();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    width: 100.w,
                    height: 100.h,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InputField(
                    controller: bloc.name,
                    label: "Name",
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: bloc.email,
                    label: "Email",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: bloc.password,
                    label: "Password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: bloc.phone,
                    label: "Phone",
                    icon: Icons.call,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocConsumer(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state is FailedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.err.toString(),
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        isLoading: state is LoadingState,
                        text: "Register",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            bloc.add(
                              event,
                            );
                          }
                        },
                        width: 200.w,
                        height: 50.h,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text.rich(
                      TextSpan(
                          text: "Have an Account? ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  pushAndRemoveUntil(
                                    const LoginView(),
                                  );
                                },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

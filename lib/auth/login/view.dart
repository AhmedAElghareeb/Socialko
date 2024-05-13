import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:socialko/auth/login/bloc.dart';
import 'package:socialko/utils/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final email = TextEditingController();
  final bloc = KiwiContainer().resolve<LoginBloc>();

  final event = StartLoginEvent();

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
                    controller: bloc.email,
                    label: "Email",
                    icon: Icons.mail_outline_outlined,
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
                        text: "Login",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

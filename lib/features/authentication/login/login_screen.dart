import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrdev_app/di/injection.dart';
import 'package:metrdev_app/features/authentication/login/cubit/login_screen_cubit.dart';
import 'package:metrdev_app/features/shared/components/custom_text_field.dart';
import 'package:metrdev_app/routing/routes.dart';
import 'package:metrdev_app/util/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _cubit = getIt<LoginScreenCubit>();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  void _signIn() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final String email = _emailTextController.text.trim();
      final String password = _passwordTextController.text.trim();
      _cubit.signIn(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenCubit, LoginScreenState>(
      bloc: _cubit,
      listener: (context, state) {
        switch (state) {
          case LoginScreenSuccessState():
            Navigator.pushReplacementNamed(context, dashboardRoute);
            break;

          case LoginScreenErrorState():
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            break;

          default:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.backgroundColor,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
            ),
            title: Text(
              "Log In",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.white, fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: state is LoginScreenLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26, 14, 26, 10),
                          child: Container(
                            width: double.infinity,
                            height: 350,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                color: const Color(0xFF213345),
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Column(
                              children: [
                                const SizedBox(height: 18),
                                CustomTextField(
                                  hint: "you@gmail.com",
                                  label: "Email Address",
                                  controller: _emailTextController,
                                  validator: (value) {
                                    bool isValidEmail = value != null &&
                                        RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                            .hasMatch(value);
                                    return isValidEmail
                                        ? null
                                        : "Please provide a valid email address";
                                  },
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  hint: "not less than 8 characters",
                                  label: "Password",
                                  controller: _passwordTextController,
                                  obscureText: _obscureText,
                                  isPasswordField: true,
                                  validator: (value) {
                                    return value == null || value.length < 8
                                        ? "Please enter a valid password"
                                        : null;
                                  },
                                  passwordVisibilityIcon: InkWell(
                                    onTap: () => setState(() {
                                      _obscureText = !_obscureText;
                                    }),
                                    child: _obscureText
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: AppColors.appYellow,
                                            size: 20,
                                          )
                                        : const Icon(
                                            Icons.visibility_rounded,
                                            color: AppColors.appYellow,
                                            size: 20,
                                          ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: _signIn,
                                  child: Container(
                                    width: double.infinity,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: AppColors.appYellow,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: const Center(child: Text("Log In")),
                                  ),
                                ),
                                const SizedBox(height: 14),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 120,
                              height: 30,
                              child: Divider(color: Color(0xFF213345)),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "OR",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: AppColors.appGrey),
                            ),
                            const SizedBox(width: 16),
                            const SizedBox(
                              width: 120,
                              height: 30,
                              child: Divider(color: Color(0xFF213345)),
                            )
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: SvgPicture.asset("assets/images/svg/google.svg"),
                            ),
                            const SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: SvgPicture.asset("assets/images/svg/apple_icon.svg"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Do not have an account?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.appGrey, fontSize: 12),
                              ),
                              const SizedBox(width: 3),
                              Text("Sign up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.appYellow)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

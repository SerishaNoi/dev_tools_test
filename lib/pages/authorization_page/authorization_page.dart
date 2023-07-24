import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:dev_tools_test/pages/authorization_page/cubit/authorization_cubit.dart';
import 'package:dev_tools_test/pages/widgets/link_button.dart';
import 'package:dev_tools_test/pages/widgets/main_button.dart';
import 'package:dev_tools_test/pages/widgets/styled_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late final UserCredential? userCredential;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purpleHard,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTextField(
              controller: emailController,
              label: 'E-Mail',
            ),
            const SizedBox(
              height: 16,
            ),
            StyledTextField(
              controller: passwordController,
              label: 'Пароль',
            ),
            const SizedBox(
              height: 16,
            ),
            LinkButton(
              buttonColor: AppColors.link,
              isNeedToUnderline: false,
              onTap: () {},
              textSize: 12,
              title: 'Забыли пароль?',
            ),
            const SizedBox(
              height: 16,
            ),
            MainButton(
              onPressed: () {
                context.read<AuthorizationCubit>().logInByEmail(
                      email: emailController.value.text,
                      password: passwordController.value.text,
                    );
              },
              title: 'Войти',
              titleColor: AppColors.bgCard,
              titleSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}

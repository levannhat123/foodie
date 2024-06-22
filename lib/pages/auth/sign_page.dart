import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodie_flutter/components/button/app_btn.dart';

import 'package:foodie_flutter/components/text_field/app_text_field.dart';
import 'package:foodie_flutter/components/text_field/app_text_field_pass.dart';
import 'package:foodie_flutter/pages/auth/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool ischeck = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 46, bottom: 20.0),
          children: [
            const Text(
              'Rigister',
              style: TextStyle(color: Colors.red, fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Create your new account",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 18.0),
            ),
            const SizedBox(
              height: 60.0,
            ),
            AppTextField(
              controller: nameController,
              hintText: 'FullName',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              controller: emailController,
              hintText: 'Email or Phone',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextFieldPass(
              controller: passController,
              hintext: 'Password',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20.0,
            ),
            AppTextFieldPass(
              controller: confirmController,
              hintext: 'Confirm Password',
              textInputAction: TextInputAction.none,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0, bottom: 6.0),
                  child: Icon(
                    ischeck
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                    size: 20.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to your',
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 16.0),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: ' privacy policy',
                          style: const TextStyle(
                              color: Colors.red, fontSize: 16.0),
                        ),
                        const TextSpan(text: ' and'),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: ' term & conditions',
                          style: const TextStyle(
                              color: Colors.red, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            const AppElevatedButton(text: 'Sign Up'),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Alrealy an account? ,",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.red, fontSize: 16.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

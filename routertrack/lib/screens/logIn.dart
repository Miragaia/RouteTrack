import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:routertrack/firebase_ath/firebase_auth_services.dart';
import 'package:routertrack/routes.dart';
import 'package:routertrack/screens/home.dart';
import 'package:routertrack/widgets/CustomElevatedButton.dart';
import 'package:routertrack/widgets/CustomImageView.dart';
import 'package:routertrack/widgets/CustomTextFormField.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Welcome Back!",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 250,
                        margin: const EdgeInsets.only(left: 10, right: 75),
                        child: Text(
                          "Fill your details to continue",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Email Address",
                      textInputType: TextInputType.emailAddress,
                      prefix: Container(
                        margin: const EdgeInsets.fromLTRB(20, 15, 10, 15),
                        child: CustomImageView(
                          imagePath: 'assets/images/img_message.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      prefixConstraints: const BoxConstraints(
                        maxHeight: 54,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: const EdgeInsets.fromLTRB(20, 14, 14, 14),
                        child: CustomImageView(
                          imagePath: 'assets/images/img_lock.svg',
                          height: 26,
                          width: 20,
                        ),
                      ),
                      prefixConstraints: const BoxConstraints(
                        maxHeight: 54,
                      ),
                      obscureText: _isObscured,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscured = !_isObscured; // Toggle password visibility
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(30, 21, 20, 20),
                          child: CustomImageView(
                            imagePath: _isObscured
                                ? 'assets/images/img_eyeslash.svg'
                                : 'assets/images/eye-outline.svg',
                            height: 13,
                            width: 16,
                          ),
                        ),
                      ),
                      suffixConstraints: const BoxConstraints(
                        maxHeight: 54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 35),
                    CustomElevatedButton(
                      text: "LOG IN",
                      onPressed: () {
                        _signIn();
                      },
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 9),
                          child: SizedBox(
                            width: 20,
                            child: Divider(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Or Continue with",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 9),
                          child: SizedBox(
                            width: 30,
                            child: Divider(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "New User? ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: "Create Account",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      // Navigate to home page after successful sign in
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else {
      print("Sign in failed");
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:routertrack/firebase_ath/firebase_auth_services.dart';
import 'package:routertrack/routes.dart';
import 'package:routertrack/screens/home.dart';
import 'package:routertrack/theme/CustomTextStyles.dart';
import 'package:routertrack/widgets/CustomElevatedButton.dart';
import 'package:routertrack/widgets/CustomImageView.dart';
import 'package:routertrack/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Text(
                          "Register Account",
                          style: CustomTextStyles.headlineLargeSemiBold(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: screenWidth * 0.55,
                        margin: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Text(
                          "Fill your details or continue with Gmail/Facebook",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _buildUserName(context, screenHeight, screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    _buildEmail(context, screenHeight, screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    _buildPassword(context, screenHeight, screenWidth),
                    SizedBox(height: screenHeight * 0.05),
                    _buildSIGNUP(context),
                    SizedBox(height: screenHeight * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          child: SizedBox(
                            width: screenWidth * 0.2,
                            child: const Divider(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.02),
                          child: Text(
                            "Or Continue with",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          child: SizedBox(
                            width: screenWidth * 0.3,
                            child: Divider(
                              indent: screenWidth * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.logInScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already Have an Account? ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: "Log In",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context, double screenHeight, double screenWidth) {
    return CustomTextFormField(
      controller: userNameController,
      hintText: "User Name",
      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
        child: CustomImageView(
          imagePath: 'assets/images/img_lock.svg',
          height: screenHeight * 0.03,
          width: screenWidth * 0.05,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context, double screenHeight, double screenWidth) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email Address",
      textInputType: TextInputType.emailAddress,
      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
        child: CustomImageView(
          imagePath: 'assets/images/img_message.svg',
          height: screenHeight * 0.03,
          width: screenWidth * 0.05,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context, double screenHeight, double screenWidth) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
        child: CustomImageView(
          imagePath: 'assets/images/img_location_gray_700.svg',
          height: screenHeight * 0.03,
          width: screenWidth * 0.05,
        ),
      ),
      obscureText: true,
    );
  }

  Widget _buildSIGNUP(BuildContext context) {
    return CustomElevatedButton(
      text: "SIGN UP",
      onPressed: () {
        _signUp();
      },
    );
  }

  void _signUp() async {
    String username = userNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      // Navigate to the home page
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else {
      print("Sign up failed");
    }
  }
}

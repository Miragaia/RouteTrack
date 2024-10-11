import 'package:flutter/material.dart';
import 'package:routertrack/screens/logIn.dart';
import 'package:routertrack/widgets/CustomImageView.dart';
import 'package:routertrack/theme/theme.dart';
import 'package:routertrack/widgets/CustomElevatedButton.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 75),
              CustomImageView(
                imagePath: 'assets/images/img_logo_1.png',
                height: 364,
                width: 375,
              ),
              const SizedBox(height: 24),
              Text(
                "FindMe",
                style: theme.textTheme.displaySmall,
              ),
              const SizedBox(height: 48),
              Container(
                width: 304,
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  "Your journey, always on track!",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.63,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              CustomElevatedButton(
                width: 261,
                text: "Let’s Get Started",
                rightIcon: Container(
                  margin: const EdgeInsets.only(left: 7),
                  child: CustomImageView(
                    imagePath: 'assets/images/img_arrowright.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                buttonTextStyle: theme.textTheme.bodyLarge,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

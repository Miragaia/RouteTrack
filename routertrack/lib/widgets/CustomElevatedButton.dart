import 'package:flutter/material.dart';
import 'BaseButton.dart';
import 'package:routertrack/theme/CustomTextStyles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final TextStyle? buttonTextStyle;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final bool? isDisabled;

  CustomElevatedButton({
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.leftIcon,
    this.rightIcon,
    this.buttonTextStyle,
    this.height,
    this.width,
    this.margin,
    this.decoration,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 54.0,
      width: width ?? double.maxFinite,
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: isDisabled ?? false ? null : onPressed ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftIcon ?? const SizedBox.shrink(),
            Text(
              text,
              style: buttonTextStyle ??
                  CustomTextStyles.titleMediumOnPrimaryContainerMedium(context),
            ),
            rightIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

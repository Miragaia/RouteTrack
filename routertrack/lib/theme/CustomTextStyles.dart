import 'package:flutter/material.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static TextStyle bodyLarge18(BuildContext context) => 
      Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: 18.0,
      );
  
  static TextStyle bodyLargeOnPrimaryContainer(BuildContext context) => 
      Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1),
      );
  
  static TextStyle bodyLargeSofiaPro(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.sofiaPro;
  
  static TextStyle bodyLargeff6a6a6a(BuildContext context) => 
      Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: const Color(0XFF6A6A6A),
      );
  
  static TextStyle bodySmallGray50001(BuildContext context) => 
      Theme.of(context).textTheme.bodySmall!.copyWith(
        color: const Color(0xFF9E9E9E),
      );
  
  static TextStyle bodySmallGray50002(BuildContext context) => 
      Theme.of(context).textTheme.bodySmall!.copyWith(
        color: const Color(0xFFBDBDBD),
      );
  
  static TextStyle bodySmallSofiaProGray50001(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.sofiaPro.copyWith(
        color: const Color(0xFF9E9E9E),
      );
  
  // Headline text style
  static TextStyle headlineLargeSemiBold(BuildContext context) => 
      Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  
  // Label text style
  static TextStyle labelLargeSofiaProGray50001(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge!.sofiaPro.copyWith(
        color: const Color(0xFF9E9E9E),
      );
  
  // Title text style
  static TextStyle titleLargeGray700(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
        color: const Color(0xFF616161),
        fontWeight: FontWeight.w300,
      );
  
  static TextStyle titleMediumGray700(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
        color: const Color(0xFF616161),
        fontWeight: FontWeight.w300,
      );
  
  static TextStyle titleLargeInter(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.inter.copyWith(
        fontSize: 23.0,
        fontWeight: FontWeight.w700,
      );
  
  static TextStyle titleLargeMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  
  static TextStyle titleMediumOnPrimary(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );
  
  static TextStyle titleMediumOnPrimaryContainer(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1),
      );
  
  static TextStyle titleMediumOnPrimaryContainerMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  
  static TextStyle titleMediumSofiaPro(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.sofiaPro;
  
  static TextStyle titleMediumff1a1d1e(BuildContext context) => 
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: const Color(0XFF1A1D1E),
        fontWeight: FontWeight.w500,
      );
  
  static TextStyle titleMediumff6a6a6a(BuildContext context) => 
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: const Color(0XFF6A6A6A),
        fontWeight: FontWeight.w500,
      );

  static TextStyle bodyLargePoppins(BuildContext context) => 
      Theme.of(context).textTheme.bodyLarge!.poppins.copyWith(
        fontSize: 18.0,
      );

  static TextStyle bodyLargePoppins_1(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.poppins;
  
  static TextStyle bodyMedium14(BuildContext context) => 
      Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 14.0,
      );

  static TextStyle titleLargeInterOnPrimaryContainer(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.inter.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
      );

  static TextStyle titleMediumOnSecondaryContainer(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        fontSize: 18.0,
      );

  static TextStyle titleMediumPoppinsOnPrimary(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.poppins.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );
  
  static TextStyle titleMediumPoppinsOnPrimaryContainer(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.poppins.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  
  static TextStyle titleMediumPoppinsOnSecondaryContainer(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.poppins.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        fontWeight: FontWeight.w600,
      );

  static TextStyle titleMediumSofiaProOnSecondaryContainer(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.sofiaPro.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        fontWeight: FontWeight.w600,
      );
  
  static TextStyle titleSmallOnSecondaryContainer(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get sofiaPro {
    return copyWith(
      fontFamily: 'Sofia Pro',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}

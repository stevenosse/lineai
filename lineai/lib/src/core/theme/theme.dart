import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: use_full_hex_values_for_flutter_colors
class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0XFF77a62b),
      surfaceTint: Color(4283328041),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291882401),
      onPrimaryContainer: Color(4279377664),
      secondary: Color(4284047945),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292732871),
      onSecondaryContainer: Color(4279639562),
      tertiary: Color(4281951842),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290571494),
      onTertiaryContainer: Color(4278198302),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(0XFFFFFFFF),
      onBackground: Color(0XFF09090B),
      surface: Color(0XFFF4F4F5),
      onSurface: Color(0XFF09090B),
      surfaceVariant: Color(4292994261),
      onSurfaceVariant: Color(4282730557),
      outline: Color(4285888620),
      outlineVariant: Color(4291152057),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282858),
      inverseOnSurface: Color(4294046438),
      inversePrimary: Color(4290039943),
      primaryFixed: Color(4291882401),
      onPrimaryFixed: Color(4279377664),
      primaryFixedDim: Color(4290039943),
      onPrimaryFixedVariant: Color(4281814291),
      secondaryFixed: Color(4292732871),
      onSecondaryFixed: Color(4279639562),
      secondaryFixedDim: Color(4290890412),
      onSecondaryFixedVariant: Color(4282468914),
      tertiaryFixed: Color(4290571494),
      onTertiaryFixed: Color(4278198302),
      tertiaryFixedDim: Color(4288729290),
      onTertiaryFixedVariant: Color(4280241738),
      surfaceDim: Color(4292533200),
      surfaceBright: Color(4294638318),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243561),
      surfaceContainer: Color(4293849059),
      surfaceContainerHigh: Color(4293454301),
      surfaceContainerHighest: Color(4293059544),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0XFFaced42),
      surfaceTint: Color(4290039943),
      onPrimary: Color(4280432128),
      primaryContainer: Color(4281814291),
      onPrimaryContainer: Color(4291882401),
      secondary: Color(4290890412),
      onSecondary: Color(4281021214),
      secondaryContainer: Color(4282468914),
      onSecondaryContainer: Color(4292732871),
      tertiary: Color(4288729290),
      onTertiary: Color(4278204212),
      tertiaryContainer: Color(4280241738),
      onTertiaryContainer: Color(4290571494),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(0XFF09090B),
      onBackground: Color(4293059544),
      surface: Color(0XFF212123),
      onSurface: Color(4293059544),
      surfaceVariant: Color(4282730557),
      onSurfaceVariant: Color(4291152057),
      outline: Color(4287599237),
      outlineVariant: Color(4282730557),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059544),
      inverseOnSurface: Color(4281282858),
      inversePrimary: Color(4283328041),
      primaryFixed: Color(4291882401),
      onPrimaryFixed: Color(4279377664),
      primaryFixedDim: Color(4290039943),
      onPrimaryFixedVariant: Color(4281814291),
      secondaryFixed: Color(4292732871),
      onSecondaryFixed: Color(4279639562),
      secondaryFixedDim: Color(4290890412),
      onSecondaryFixedVariant: Color(4282468914),
      tertiaryFixed: Color(4290571494),
      onTertiaryFixed: Color(4278198302),
      tertiaryFixedDim: Color(4288729290),
      onTertiaryFixedVariant: Color(4280241738),
      surfaceDim: Color(4279374862),
      surfaceBright: Color(4281874994),
      surfaceContainerLowest: Color(4279045897),
      surfaceContainerLow: Color(4279901206),
      surfaceContainer: Color(4280164377),
      surfaceContainerHigh: Color(4280888099),
      surfaceContainerHighest: Color(4281546286),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle:
              colorScheme.brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: colorScheme.surface,
        )
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

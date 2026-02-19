import 'package:flutter/material.dart';
import 'package:portafolilo/l10n/app_localizations.dart';
import 'package:portafolilo/style/app_size.dart';
import 'app_text_styles.dart';

enum FormFactorType{
  mobile,
  tablet,
  desktop,
}

extension StyledContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;

  ThemeData get theme => Theme.of(this);

  FormFactorType get formFactor{
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
    }

    bool get isMobile => formFactor == FormFactorType.mobile;
    bool get isTablet => formFactor == FormFactorType.tablet;
    bool get isDesktop => formFactor == FormFactorType.desktop;

    AppTextStyles get textStyle{
      switch (formFactor){
        case FormFactorType.mobile:
        case FormFactorType.tablet:
          return SmallTextStyles();
        case FormFactorType.desktop:
          return LargeTextStyles();
      }
    }

    AppInsets get insets{
      switch (formFactor){
        case FormFactorType.mobile:
          return SmallInsets();
        case FormFactorType.tablet:
        case FormFactorType.desktop:
          return LargeInsets();
      }
    }

    AppLocalizations get texts => AppLocalizations.of(this)??lookupAppLocalizations(const Locale('en'));

    ColorScheme get colorScheme => theme.colorScheme;
  }

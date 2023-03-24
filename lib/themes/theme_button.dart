import 'package:flutter/material.dart';

import 'custom_colors.dart';

class ThemeButton {
  static ButtonStyle primaryButtonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(CustomColors.primaryColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
  static ButtonStyle secondaryButtonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(CustomColors.primaryAccentColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
  static ButtonStyle disabledButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
  static ButtonStyle borderedButtonStyle = ButtonStyle(
    side: MaterialStateProperty.all<BorderSide>(const BorderSide(
      width: 1,
      color: Colors.white,
    )),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

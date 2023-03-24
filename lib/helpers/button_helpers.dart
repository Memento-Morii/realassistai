import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonHelper {
  static Widget showButtonWithLoading(
      {color = Colors.white,
      double progressIndicatorWidth = 20,
      double progressIndicatorHeight = 20}) {
    return Platform.isAndroid
        ? SizedBox(
            width: progressIndicatorWidth,
            height: progressIndicatorHeight,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          )
        : SizedBox(
            width: progressIndicatorWidth,
            height: progressIndicatorHeight,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
  }
}

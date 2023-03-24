import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realassistai/themes/theme_text.dart';

import '../helpers/button_helpers.dart';
import '../themes/theme_button.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    this.width = 100,
    this.height = 45,
    required this.label,
    required this.onPressed,
    this.isLoading,
    this.isDisabled = false,
    this.hasLoading = false,
    this.isSuffixIcon = true,
    this.isPrimaryButton = true,
    this.prefixIcon,
  }) : super(key: key);
  final double height;
  final double width;
  final String? label;
  final Function? onPressed;
  final bool? isDisabled;
  final RxBool? isLoading;
  final bool? hasLoading;
  final bool isSuffixIcon;
  final bool isPrimaryButton;
  final Icon? prefixIcon;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  _showTextWithLoading() {
    return Obx(
      () => widget.isLoading!.isTrue
          ? ButtonHelper.showButtonWithLoading()
          : FittedBox(
              child: Text(
                widget.label!,
                style: ThemeText.bodyBoldWhiteTwo,
              ),
            ),
    );
  }

  _showTextWithLoadingAndIcon() {
    return Obx(
      () => widget.isLoading!.isTrue
          ? ButtonHelper.showButtonWithLoading()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.prefixIcon!,
                FittedBox(
                  child: Text(
                    widget.label!,
                    style: ThemeText.bodyBoldWhiteTwo,
                  ),
                ),
              ],
            ),
    );
  }

  _showTextWithIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.prefixIcon!,
        Text(
          widget.label!,
          style: ThemeText.bodyBoldWhiteTwo,
        ),
      ],
    );
  }

  _showOnlyText() {
    return FittedBox(
      child: Text(
        widget.label!,
        style: ThemeText.bodyBoldWhiteTwo,
      ),
    );
  }

  Widget child() {
    if (widget.hasLoading! && widget.prefixIcon == null) {
      return _showTextWithLoading();
    } else if (widget.hasLoading! && widget.prefixIcon != null) {
      return _showTextWithLoadingAndIcon();
    } else if (widget.hasLoading! == false && widget.prefixIcon != null) {
      return _showTextWithIcon();
    }

    return _showOnlyText();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading == null) {
      widget.isLoading?.value = false;
    }
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: widget.isLoading?.value == null
          ? _showTextButton()
          : Obx(
              () => _showTextButton(),
            ),
    );
  }

  _showTextButton() {
    return TextButton(
      style: widget.isLoading?.value != null && widget.isLoading!.value
          ? ThemeButton.disabledButtonStyle
          : !widget.isPrimaryButton
              ? ThemeButton.secondaryButtonStyle
              : ThemeButton.primaryButtonStyle,
      onPressed: () {
        if (widget.isLoading != null && widget.isLoading!.isTrue) {
          return;
        }
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
        widget.onPressed!();
      },
      child: child(),
    );
  }
}

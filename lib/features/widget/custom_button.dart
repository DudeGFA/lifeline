import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/dimensions.dart';

class PrimaryButton extends StatelessWidget {
  final String? buttonTitle;
  final Function()? onPressed;
  final bool? enableButton;
  final double? butttonWidth;
  final double? buttonHeight;
  final TextStyle? buttonTitleTextStyle;
  final Color? buttonColor;
  final Color? splashColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    this.buttonTitle,
    this.enableButton,
    this.buttonHeight,
    this.buttonTitleTextStyle,
    this.splashColor,
    this.buttonColor,
    this.butttonWidth,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enableButton == true ? onPressed : null,
      disabledColor: Colors.grey,
      disabledTextColor: Theme.of(context).primaryColor.withOpacity(0.2),
      elevation: 0,
      minWidth: butttonWidth ?? MediaQuery.of(context).size.width / 1,
      height: buttonHeight ?? getProportionateScreenHeight(50),
      textColor: enableButton == true
          ? Theme.of(context).buttonTheme.colorScheme!.onPrimary
          : Theme.of(context).primaryColor.withOpacity(0.2),
      color: enableButton == true
          ? buttonColor ?? AppColors.secondaryColor
          : AppColors.greyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 7),
        ),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      splashColor: splashColor,
      child: Text(
        buttonTitle ?? "",
        style: enableButton == true
            ? buttonTitleTextStyle ??
                Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: enableButton == true
                          ? Theme.of(context).buttonTheme.colorScheme!.onPrimary
                          : Theme.of(context).primaryColor.withOpacity(0.2),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    )
            : Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
      ),
    );
  }
}

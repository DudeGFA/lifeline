// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool isEnabled;
  final int? maxLength;
  final bool isFieldValidated;
  final String? initialValue;
  final bool addBorder;
  final int? maxlines;
  const AppTextField({
    Key? key,
    this.label,
    this.isFieldValidated = false,
    this.prefixIcon,
    this.initialValue,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.formatter,
    this.validator,
    this.textEditingController,
    this.isEnabled = true,
    this.onSaved,
    this.addBorder = false,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
          style: GoogleFonts.openSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.blackColor : null,
          ),
        ),
        SpacingManager.h10,
        SizedBox(
          // height: 50.h,
          child: TextFormField(
            // maxLines: maxlines,
            initialValue: initialValue,

            maxLines: maxlines ?? 1,
            autovalidateMode: AutovalidateMode.always,
            maxLengthEnforcement: MaxLengthEnforcement.none,

            enabled: isEnabled,
            onTap: onTap,
            // maxLength: maxLength,
            onSaved: onSaved,
            controller: textEditingController!,

            // cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
            cursorColor: isDark ? Colors.white : Colors.black,
            cursorWidth: 0.7,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            onChanged: (text) {
              if (onChanged != null) onChanged!(text);
            },

            validator: validator,
            inputFormatters: [
              formatter ?? FilteringTextInputFormatter.singleLineFormatter
            ],
            style: GoogleFonts.openSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),

            decoration: InputDecoration(
                errorStyle: GoogleFonts.openSans(
                  color: theme.colorScheme.error,
                  fontSize: 10.sp,
                ),
                hintStyle: GoogleFonts.openSans(
                    fontSize: 14.sp,
                    color: const Color(0XFFBEBECB),
                    fontWeight: FontWeight.w700),
                hintText: hintText,
                contentPadding: const EdgeInsets.only(
                  left: 15.0,
                  top: 19.0,
                ),
                // filled: true,
                suffixIcon: suffixIcon,
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: !addBorder ? Colors.white : AppColors.greyColor,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: !addBorder ? Colors.white : AppColors.greyColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: !addBorder ? Colors.white : AppColors.greyColor,
                        width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: !addBorder ? Colors.white : AppColors.greyColor,
                        // AppColors.sGreyColor.withOpacity(.3),
                        width: 1.5),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(5.0)))),
          ),
        )
      ],
    );
  }
}

class AppCustomDropDownCard extends StatelessWidget {
  final String? label;
  final VoidCallback onTap;
  final String hinText;
  final bool? isCheck;
  const AppCustomDropDownCard({
    Key? key,
    this.label,
    required this.onTap,
    this.isCheck,
    required this.hinText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: theme.textTheme.bodyMedium!.copyWith(),
        ),
        SpacingManager.h10,
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.greyColor, width: 1.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hinText,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: AppColors.greyColor),
                ),
                isCheck == false
                    ? const Icon(
                        Icons.keyboard_arrow_up,
                        color: AppColors.greyColor,
                      )
                    : const Icon(Icons.keyboard_arrow_down,
                        color: AppColors.greyColor)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

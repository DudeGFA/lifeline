import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constant/color.dart';

class CustomTextField extends StatefulWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final String? label;
  final String? errorText;
  final bool? readOnly;
  final String? readText;
  final double? fontSize;
  final double? hintFontSize;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputType? textInputType;
  final Icon? icon;
  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.label,
    this.fontSize,
    this.hintFontSize,
    this.controller,
    required this.hintText,
    this.icon,
    this.readOnly,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.textInputType,
    required this.obscureText,
    this.readText,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return widget.label != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label!,
                style: const TextStyle(
                    color: AppColors.greyColor, fontFamily: 'Medium'),
              ),
              const SizedBox(
                height: 5,
              ),
              // widget.readOnly ?? false
              //     ? Container(
              //         height: 48,
              //         width: Get.width,
              //         decoration: BoxDecoration(
              //             border: Border.all(color: AppColors.grey[200]),
              //             borderRadius: BorderRadius.circular(Sizes.br)),
              //         child: Padding(
              //           padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
              //           child: Text(widget.readText ?? '',
              //               style: TextStyle(
              //                   color: AppColors.grey[60],
              //                   fontSize: widget.hintFontSize ?? Sizes.b2)),
              //         ),
              //       )
              //     :
              TextFormField(
                onTap: widget.onTap,
                readOnly: widget.readOnly ?? false,
                obscureText: widget.obscureText == false ? false : !show,
                validator: widget.validator,
                inputFormatters: widget.inputFormatters,
                controller: widget.controller,
                onSaved: widget.onSaved,
                initialValue: widget.readText,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onFieldSubmitted,
                keyboardType: widget.textInputType ?? TextInputType.text,
                style: TextStyle(fontSize: widget.fontSize ?? 16),
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    errorText: widget.errorText,
                    suffix: widget.icon,
                    suffixIcon: widget.obscureText
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                show = !show;
                              });
                            },
                            child: show
                                ? const Icon(
                                    Icons.visibility,
                                    color: AppColors.greyColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.greyColor,
                                  ),
                          )
                        : const SizedBox(),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                        fontSize: widget.hintFontSize ?? 16),
                    isDense: true,
                    // contentPadding: const EdgeInsets.all(10),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.secondaryColor, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.4),
                            width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7.5))),
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.greyColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.greyColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: HexColors.blue10, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.redColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ],
          )
        : TextFormField(
            onTap: widget.onTap,
            readOnly: widget.readOnly ?? false,
            obscureText: widget.obscureText == false ? false : !show,
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            onSaved: widget.onSaved,
            initialValue: widget.readText,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            keyboardType: widget.textInputType ?? TextInputType.text,
            style: TextStyle(fontSize: widget.fontSize ?? 16),
            decoration: InputDecoration(
                hintText: widget.hintText,
                suffix: widget.icon,
                suffixIcon: widget.obscureText
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: show
                            ? const Icon(
                                Icons.visibility,
                                color: AppColors.greyColor,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppColors.greyColor,
                              ),
                      )
                    : const SizedBox(),
                hintStyle: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                    fontSize: widget.hintFontSize ?? 16),
                isDense: true,
                // contentPadding: const EdgeInsets.all(10),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.secondaryColor, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                        width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(7.5))),
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.lightgrey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.lightgrey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.secondaryColor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.redColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          );
  }
}

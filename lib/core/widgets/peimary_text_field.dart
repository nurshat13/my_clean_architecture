import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_clean_architecture/core/constants/app_colors.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.labelText,
    this.counterText,
    this.maxLength,
    this.maxLines,
    this.keyboardType,
    this.textInputAction,
    this.svgIcon,
    this.controller,
    this.isRequierd,
    this.validator,
    this.onTap,
    this.readOnly,
    this.onChanged,
  });

  final String labelText;
  final String? counterText;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? svgIcon;
  final TextEditingController? controller;
  final bool? isRequierd;
  final bool? readOnly;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      style: ThemeData().textTheme.bodyLarge,
      controller: controller,
      validator: validator,
      readOnly: readOnly ?? false,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: ThemeData().textTheme.bodyMedium!.copyWith(color: AppColors.gray),
        label: RichText(
          text: TextSpan(
            style: ThemeData().textTheme.bodyMedium!.copyWith(color: AppColors.gray),
            children: [
              TextSpan(text: labelText),
              if (isRequierd ?? false)
                TextSpan(
                  text: ' *',
                  style: ThemeData().textTheme.bodyMedium!.copyWith(color: AppColors.error),
                ),
            ],
          ),
        ),
        counterText: counterText ?? '',
        prefixIcon: svgIcon != null
            ? Padding(
                padding: EdgeInsets.only(left: 16.w, right: 2.5.w),
                child: SvgPicture.asset(
                  height: 24.h,
                  width: 24.w,
                  svgIcon!,
                ),
              )
            : null,
      ),
    );
  }
}

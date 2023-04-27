import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppDropdownButton<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final String hintText;
  final void Function(T newValue) onChanged;

  const AppDropdownButton({
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: AppTheme.dropDownBorderColor,
        ),
        color: AppTheme.dropDownBgColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          iconEnabledColor: AppTheme.primaryTextColor,
          icon: AppIconsTheme.downArrow.call(),
          value: value,
          dropdownColor: AppTheme.dropDownBgColor,
          borderRadius: BorderRadius.circular(10),
          hint: Text(
            hintText,
            style: AppTextTheme.manrope16Regular.copyWith(color: AppTheme.dropDownTextColor),
          ),
          items: items,
          onChanged: (T? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          style: AppTextTheme.manrope16Regular.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

import 'package:evently_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String? label;
  final IconData? icon;

  const OptionButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final contentColor = isSelected ? AppColor.whiteColor : theme.primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: label != null ? 16 : 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : theme.highlightColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: label != null
            ? Text(
          label!,
          style: theme.textTheme.labelLarge!.copyWith(color: contentColor),
        )
            : Icon(icon, size: 20, color: contentColor),
      ),
    );
  }
}
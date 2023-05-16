import 'package:beritaku/core/utils/app_constant.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.icon,
    super.key,
  });

  final Widget? icon;
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor:
          isSelected ? ColorConstant.light900 : ColorConstant.light700,
      label: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: isSelected ? ColorConstant.light700 : Colors.grey,
            ),
      ),
      onPressed: onTap,
      avatar: icon,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      side: BorderSide(
        color: isSelected ? Colors.grey : ColorConstant.light900,
      ),
    );
  }
}

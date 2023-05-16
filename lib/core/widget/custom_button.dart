import 'package:beritaku/core/utils/app_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.color = const Color(0xFF263C66),
    this.margin,
  });

  final Function()? onTap;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 40.0,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 12.0),
          backgroundColor: color,
          disabledBackgroundColor: ColorConstant.light700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: onTap == null ? ColorConstant.light900 : Colors.white,
              ),
        ),
      ),
    );
  }
}

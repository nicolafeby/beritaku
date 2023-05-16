import 'package:beritaku/core/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeFloatingButton extends StatelessWidget {
  final Function() onTap;
  const HomeFloatingButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: ColorConstant.light900,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(FontAwesomeIcons.filter, size: 18.0),
            SizedBox(width: 8.0),
            Text('Category'),
          ],
        ),
      ),
    );
  }
}

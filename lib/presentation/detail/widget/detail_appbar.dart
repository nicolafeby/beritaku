import 'package:beritaku/core/utils/app_constant.dart';
import 'package:beritaku/core/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      elevation: 2.0,
      iconThemeData: const IconThemeData(color: Colors.black),
      backgroundColor: ColorConstant.light700,
      title: Text(
        'Detail',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.iconThemeData,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.elevation,
    super.key,
    this.bottom,
  });

  final List<Widget>? actions;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final IconThemeData? iconThemeData;
  final Widget? leading;
  final Widget title;

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      centerTitle: false,
      iconTheme: iconThemeData,
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leading,
      title: Container(
        margin: const EdgeInsets.all(16.0),
        child: title,
      ),
      actions: actions,
      toolbarHeight: 50.0,
    );
  }
}

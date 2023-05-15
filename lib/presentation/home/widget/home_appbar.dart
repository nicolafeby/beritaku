import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Beritaku'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0, top: 6.0),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search,
              size: 28.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onPressed;
  const HomeAppbar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.grey,
        ),
        onPressed: onPressed,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        'Beritaku',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0, top: 6.0),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search,
              size: 28.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

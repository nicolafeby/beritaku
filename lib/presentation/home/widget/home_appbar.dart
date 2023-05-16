import 'package:beritaku/core/model/argument/home_everything_arg.dart';
import 'package:beritaku/presentation/home/bloc/home_everything/home_everything_bloc.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final HomeEverythingBloc bloc;
  final Function() onPressed;
  final Function() onTapAction;
  final bool isSearch;
  const HomeAppbar({
    super.key,
    required this.onPressed,
    required this.onTapAction,
    required this.isSearch,
    required this.controller,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isSearch == true
          ? IconButton(
              onPressed: onTapAction,
              icon: const Icon(
                Icons.close,
                color: Colors.grey,
              ))
          : IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.grey,
              ),
              onPressed: onPressed,
            ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: isSearch == true
          ? Container()
          : Text(
              'Beritaku',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
            ),
      actions: [
        isSearch == true
            ? SizedBox(
                width: MediaQuery.of(context).size.width - 32.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'Search news'),
                    controller: controller,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      onTapAction();
                      bloc.add(HomeEverythingStarted(
                          arg: HomeEverythingArg(q: value)));
                    },
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 12.0, top: 6.0),
                child: InkWell(
                  onTap: onTapAction,
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

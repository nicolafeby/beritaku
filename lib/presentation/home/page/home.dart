import 'dart:developer';

import 'package:beritaku/core/enum/category_enum.dart';
import 'package:beritaku/core/extention/extention.dart';
import 'package:beritaku/core/model/argument/category_filter_arg.dart';
import 'package:beritaku/core/model/argument/home_headline_arg.dart';
import 'package:beritaku/core/router/router_constant.dart';
import 'package:beritaku/presentation/home/bloc/home_everything/home_everything_bloc.dart';
import 'package:beritaku/presentation/home/bloc/home_headline/home_headline_bloc.dart';
import 'package:beritaku/presentation/home/widget/home_appbar.dart';
import 'package:beritaku/presentation/home/widget/home_carousel_headline.dart';
import 'package:beritaku/presentation/home/widget/home_category_list.dart';
import 'package:beritaku/presentation/home/widget/home_drawer.dart';
import 'package:beritaku/presentation/home/widget/home_floating_button.dart';
import 'package:beritaku/presentation/home/widget/home_news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
  late CategoryFilterArg selectedCategory;

  final TextEditingController _controller = TextEditingController();
  late HomeEverythingBloc _everythingBloc;
  late HomeHeadlineBloc _headlineBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  void initState() {
    selectedCategory = const CategoryFilterArg(category: CategoryEnum.none);
    _headlineBloc = BlocProvider.of(context);
    _everythingBloc = BlocProvider.of(context);
    _headlineBloc.add(
      const HomeHeadlineStarted(
        arg: HomeHeadlineArg(
          country: 'us',
          language: 'en',
        ),
      ),
    );
    _everythingBloc.add(
      const HomeEverythingStarted(),
    );
    super.initState();
  }

  _handleOnChangedBanner(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCategory() {
    return BlocBuilder<HomeHeadlineBloc, HomeHeadlineState>(
      builder: (context, state) {
        if (state is HomeHeadlineInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeHeadlineLoadInFailure) {
          return const Text('error load data');
        }

        (state as HomeHeadlineLoadInSuccess);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Category: ${selectedCategory.category.value.toCapitalized()}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
            ),
            HomeCategoryList(entities: state.entities)
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        BlocBuilder<HomeHeadlineBloc, HomeHeadlineState>(
          builder: (context, state) {
            if (state is HomeHeadlineInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeHeadlineLoadInFailure) {
              return const Text('error load data');
            }

            (state as HomeHeadlineLoadInSuccess);

            return HomeCarouselHeadline(
              selectedIndex: _selectedIndex,
              onChangedBanner: _handleOnChangedBanner,
              entities: state.entities,
            );
          },
        ),
        BlocBuilder<HomeEverythingBloc, HomeEverythingState>(
          builder: (context, state) {
            if (state is HomeEverythingInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeEverythingLoadInFailure) {
              return const Text('error load data');
            }
            (state as HomeEverythingLoadInSuccess);
            return HomeNewsList(
              entities: state.entities,
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    log(selectedCategory.category.toString());
    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppbar(
        isSearch: isSearch,
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onTapAction: () {
          isSearch = !isSearch;
          setState(() {});
        },
        controller: _controller,
        bloc: _everythingBloc,
      ),
      drawer: const HomeDrawer(),
      body: selectedCategory.category == CategoryEnum.none
          ? _buildBody()
          : _buildCategory(),
      floatingActionButton: HomeFloatingButton(
        onTap: () async {
          final data =
              await Navigator.pushNamed(context, RouterConstant.categoryFilter);
          selectedCategory = data as CategoryFilterArg;

          setState(() {});
          _headlineBloc.add(
            HomeHeadlineStarted(
              arg: HomeHeadlineArg(
                country: 'us',
                language: 'en',
                category: selectedCategory.category.value,
              ),
            ),
          );
        },
      ),
    );
  }
}

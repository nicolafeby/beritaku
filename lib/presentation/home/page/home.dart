import 'package:beritaku/core/model/argument/home_headline_arg.dart';
import 'package:beritaku/presentation/home/bloc/home_everything/home_everything_bloc.dart';
import 'package:beritaku/presentation/home/bloc/home_headline/home_headline_bloc.dart';
import 'package:beritaku/presentation/home/widget/home_appbar.dart';
import 'package:beritaku/presentation/home/widget/home_carousel_headline.dart';
import 'package:beritaku/presentation/home/widget/home_drawer.dart';
import 'package:beritaku/presentation/home/widget/home_news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeHeadlineBloc _headlineBloc;
  late HomeEverythingBloc _everythingBloc;
  int _selectedIndex = 0;

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      drawer: const HomeDrawer(),
      body: _buildBody(),
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
            return HomeNewsList(entities: state.entities);
          },
        )
      ],
    );
  }
}

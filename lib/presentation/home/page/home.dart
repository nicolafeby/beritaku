import 'package:beritaku/presentation/home/widget/home_appbar.dart';
import 'package:beritaku/presentation/home/widget/home_carousel_headline.dart';
import 'package:beritaku/presentation/home/widget/home_drawer.dart';
import 'package:beritaku/presentation/home/widget/home_news_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
        HomeCarouselHeadline(
          selectedIndex: _selectedIndex,
          onChangedBanner: _handleOnChangedBanner,
        ),
        const HomeNewsList()
      ],
    );
  }
}

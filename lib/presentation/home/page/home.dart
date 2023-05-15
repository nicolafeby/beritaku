import 'package:beritaku/presentation/home/widget/home_appbar.dart';
import 'package:beritaku/presentation/home/widget/home_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      drawer: const HomeDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: const [],
    );
  }
}

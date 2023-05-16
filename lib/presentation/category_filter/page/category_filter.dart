import 'package:beritaku/core/enum/category_enum.dart';
import 'package:beritaku/core/extention/extention.dart';
import 'package:beritaku/core/model/argument/category_filter_arg.dart';
import 'package:beritaku/core/widget/custom_appbar.dart';
import 'package:beritaku/core/widget/custom_button.dart';
import 'package:beritaku/core/widget/custom_chip.dart';
import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  CategoryEnum? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildApplyButton(),
      appBar: CustomAppBar(
        elevation: 0,
        iconThemeData: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Category',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildChip(),
          ],
        ),
      ),
    );
  }

  Widget _buildChip() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(
        CategoryEnum.values.length - 1,
        (index) => CustomChip(
          isSelected: selectedCategory == CategoryEnum.values[index],
          label: CategoryEnum.values[index].value.toCapitalized(),
          onTap: () {
            selectedCategory = CategoryEnum.values[index];
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _buildApplyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            width: 155,
            title: 'Clear',
            onTap: () {
              selectedCategory = null;
              setState(() {});
            },
          ),
          const SizedBox(width: 12.0),
          CustomButton(
            width: 155,
            title: 'Apply',
            onTap: () {
              var data = CategoryFilterArg(
                  category: selectedCategory ?? CategoryEnum.none);
              Navigator.pop(context, data);
            },
          ),
        ],
      ),
    );
  }
}

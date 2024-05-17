import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';

class CategoryListView extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategoryTap;

  const CategoryListView({
    Key? key,
    required this.categories,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
                widget.onCategoryTap(category);
              },
              child: Chip(
                label: Text(
                  category,
                  style: isSelected
                      ? h3Style.copyWith(color: Colors.white)
                      : h3Style.copyWith(color: Colors.black),
                ),
                backgroundColor: isSelected ? Colors.grey[400] : Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: isSelected ? 10 : 0,
              ),
            ),
          );
        },
      ),
    );
  }
}

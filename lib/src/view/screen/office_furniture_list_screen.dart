import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_data.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/src/model/furniture.dart';
import 'package:hungry_hund/src/view/widget/furniture_list_view.dart';
import 'package:hungry_hund/src/view/widget/category_list_view.dart';
import 'package:hungry_hund/src/view/screen/office_furniture_detail_screen.dart';

class OfficeFurnitureListScreen extends StatefulWidget {
  const OfficeFurnitureListScreen({super.key});

  @override
  _OfficeFurnitureListScreenState createState() => _OfficeFurnitureListScreenState();
}

class _OfficeFurnitureListScreenState extends State<OfficeFurnitureListScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedCategory = "All";
  List<Furniture> filteredFurnitureList = AppData.furnitureList;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterFurniture);
    _filterFurniture();
  }

  @override
  void dispose() {
    searchController.removeListener(_filterFurniture);
    searchController.dispose();
    super.dispose();
  }

  void _filterFurniture() {
    setState(() {
      String query = searchController.text.toLowerCase();
      filteredFurnitureList = AppData.furnitureList.where((furniture) {
        bool matchesCategory = selectedCategory == "All" || furniture.category == selectedCategory;
        bool matchesSearch = furniture.title.toLowerCase().contains(query);
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  void onCategoryTap(String category) {
    setState(() {
      selectedCategory = category;
      _filterFurniture();
    });
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello World", style: h2Style),
                  Text("Ya comiste perro?", style: h3Style),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.menu, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          border: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Widget?> navigate(Furniture furniture) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) => OfficeFurnitureDetailScreen(furniture: furniture),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CategoryListView(
              categories: const ["All", "Chairs", "Tables", "Cabinets", "Sofas"],
              onCategoryTap: onCategoryTap,
            ),
            const SizedBox(height: 15),
            _searchBar(),
            filteredFurnitureList.isNotEmpty
                ? FurnitureListView(
                    furnitureList: filteredFurnitureList,
                    onTap: navigate,
                  )
                : const Center(
                    child: Text(
                      'No items found.',
                      style: h2Style,
                    ),
                  ),
            const Text("Popular", style: h2Style),
            filteredFurnitureList.isNotEmpty
                ? FurnitureListView(
                    furnitureList: filteredFurnitureList,
                    isHorizontal: false,
                    onTap: navigate,
                  )
                : const Center(
                    child: Text(
                      'No popular items found.',
                      style: h2Style,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

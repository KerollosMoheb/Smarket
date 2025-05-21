import 'package:flutter/material.dart';
import 'package:fruit_market/models/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(name: 'Fruits', image: 'assets/category/fruits.png'),
  CategoryModel(name: 'Milk & egg', image: 'assets/category/egg.png'),
  CategoryModel(name: 'Beverages', image: 'assets/category/bavergas.png'),
  CategoryModel(name: 'Laundry', image: 'assets/category/luandry.png'),
  CategoryModel(name: 'Vegetables', image: 'assets/category/vegatbels.png'),
];
SingleChildScrollView categoryListView() {
  return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        width: 70,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            categories[index].image,
                            width: 60,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        categories[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
}

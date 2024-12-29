import 'package:flutter/material.dart';
import 'package:news_app/home/category_iteam.dart';
import 'package:news_app/modal/category_model.dart';
import 'package:news_app/news/news_view.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody(
      {super.key, required this.categories, required this.onTap});
  final void Function()? onTap;
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your Category of interest',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 9.0),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewsView(categoryModel: categories[index]),
                    ),
                  );
                },
                child: CategoryIteam(
                  categoryModel: categories[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/modal/category_model.dart';

class CategoryIteam extends StatelessWidget {
  const CategoryIteam({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 5, left: 3, right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:categoryModel.color ,
      ),
      child: Column(
        children: [
          Image.asset(
            categoryModel.image,
            fit: BoxFit.fitHeight,
            height: 100,
            width: double.infinity,
          ),
          Text(
           categoryModel. title,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 25),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/home/categories_body.dart';
//import 'package:news_app/home/category_iteam.dart';
//import 'package:news_app/home/nav_bar.dart';
import 'package:news_app/modal/category_model.dart';
//import 'package:news_app/modal/source_model.dart';
import 'package:news_app/news/news_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'Home View';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // static bool isCategory = true;
  List<CategoryModel> categories = const [
    CategoryModel(title: 'sports', image: 'assets/ball.png', color: Colors.red),
    CategoryModel(
        title: 'general',
        image: 'assets/Politics.png',
        color: Color(0xff003E90)),
    CategoryModel(
        title: 'health', image: 'assets/health.png', color: Color(0xffED1E79)),
    CategoryModel(
        title: 'business',
        image: 'assets/bussines.png',
        color: Color(0xffCF7E48)),
    CategoryModel(
        title: 'entertainment',
        image: 'assets/environment.png',
        color: Color(0xff4882CF)),
    CategoryModel(
        title: 'science',
        image: 'assets/science.png',
        color: Color(0xffF2D352)),
    CategoryModel(
        title: 'technology',
        image: 'assets/science.png',
        color: Color(0xff003E90))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      // body: Stack(
      //   children: [
      //     Image.asset(
      //       'assets/pattern.png',
      //       width: double.infinity,
      //       fit: BoxFit.fill,
      //     ),
      body: category == null
          ? CategoriesBody(
              categories: categories,
              onTap: () {
                categoryOnClick;
              },
            )
          : NewsView(categoryModel: category!),
    );
  }

  CategoryModel? category;

  void categoryOnClick(CategoryModel newCategory) {
    category = newCategory;
    setState(() {});
  }
}

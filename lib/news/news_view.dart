import 'package:flutter/material.dart';
import 'package:news_app/home/nav_bar.dart';
import 'package:news_app/modal/category_model.dart';
//import 'package:news_app/news/news_iteam.dart';
import 'package:news_app/news/news_list_view.dart';
import 'package:news_app/news/sources_list_view.dart';
import 'package:news_app/provider/index_provider.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key, required this.categoryModel});
  static String id = 'News View';
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndexProvider(),
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(
          children: [
            // SourcesListView(
            //   categoryModel: categoryModel,
            // ),
            Expanded(
                child: NewsListView(
              categoryModel: categoryModel,
            )),
          ],
        ),
      ),
    );
  }
}

//var news;

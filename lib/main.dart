import 'package:flutter/material.dart';
import 'package:news_app/home/home_view.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/provider/index_provider.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:provider/provider.dart';
//import 'package:news_app/news/news_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndexProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.LightMode,
        initialRoute: HomeView.id,
        routes: {
          HomeView.id: (context) => const HomeView(),
          //  NewsView.id:(context)=>const NewsView(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modal/category_model.dart';
import 'package:news_app/modal/news_model.dart';
import 'package:news_app/modal/source_model.dart';
//import 'package:news_app/modal/news_model.dart';
import 'package:news_app/news/news_cubit/news_cubit.dart';
import 'package:news_app/news/news_iteam.dart';
import 'package:news_app/news/source_cubit/sources_view_model.dart';
import 'package:news_app/news/sources_list_view.dart';
import 'package:news_app/provider/index_provider.dart';
import 'package:provider/provider.dart';
//import 'package:news_app/news/source_iteam.dart';
//import 'package:news_app/news/sources_list_view.dart';
//import 'package:news_app/provider/news_provider.dart';
//import 'package:news_app/news/source_iteam.dart';
//import 'package:news_app/service/news_service.dart';
//import 'package:provider/provider.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  NewsViewModel viewModel = NewsViewModel();
  SourcesViewModel sourcesViewModel = SourcesViewModel();
  List<NewsModel> news = [];
  @override
  void initState() {
    viewModel.getAllNews(source: source, category: widget.categoryModel.title);
   // news = viewModel.newsList!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<IndexProvider>(context);
    // var sourceViewModel = BlocProvider.of<SourcesViewModel>(context);
    sourcesViewModel.getSources(categoryid: widget.categoryModel.title);
    //  var provider = Provider.of<NewsProvider>(context);
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsFailure) {
          return Column(
            children: [
              Text('there is an error :${state.errorMessage}'),
              ElevatedButton(
                onPressed: () {
                  viewModel.getAllNews(
                      source: '', // sources[provider.currentIndex].name,
                      category: widget.categoryModel.title);
                },
                child: const Text("try again"),
              ),
            ],
          );
        } else if (state is NewsSuccessfull) {
          return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) => NewsIteam(
              newsModel: state.newsList[index],
            ),
          );
        }
        return const Text('nothing');
      },
    );
    //   return FutureBuilder(
    //       future: NewsService()
    //           .getAllNews(source: 'ESPN', category: categoryModel.title),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(
    //             child: SingleChildScrollView(),
    //           );
    //         }
    //         if (snapshot.hasError) {
    //           return Column(
    //             children: [
    //               Text('there is an error :${snapshot.error.toString()}'),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   NewsService().getAllNews(
    //                       source: "ESPN", category: categoryModel.title);
    //                 },
    //                 child: Text("try again"),
    //               ),
    //             ],
    //           );
    //         } else if (snapshot.hasData) {
    //           List<NewsModel> news = snapshot.data ?? [];
    //           return ListView.builder(
    //             itemCount: news.length,
    //             itemBuilder: (context, index) => NewsIteam(
    //               newsModel: news[index],
    //             ),
    //           );
    //         }
    //         return Text('NoThing');
    //       });
    // }
  }
}

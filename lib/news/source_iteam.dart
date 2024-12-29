import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modal/category_model.dart';
import 'package:news_app/modal/source_model.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/news/news_cubit/news_cubit.dart';
import 'package:news_app/news/source_cubit/sources_view_model.dart';
import 'package:news_app/news/sources_list_view.dart';
import 'package:news_app/provider/index_provider.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/service/news_service.dart';
import 'package:provider/provider.dart';

class SourceIteam extends StatefulWidget {
  const SourceIteam(
      {super.key, required this.sourceList, required this.categoryModel});
  final List<SourceModel> sourceList;
  static String sourceName = '';
  final CategoryModel categoryModel;

  @override
  State<SourceIteam> createState() => _SourceIteamState();
}

class _SourceIteamState extends State<SourceIteam> {
  int currentIndex = 0;
  NewsViewModel newsViewModel = NewsViewModel();
  SourcesViewModel sourcesViewModel = SourcesViewModel();
  @override
  void initState() {
    source = widget.sourceList[0].name;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<IndexProvider>(context);
    return ListView.builder(
      itemCount: widget.sourceList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            provider.updateIndex(newIndex: index);
            source = widget.sourceList[currentIndex].name;
            //  var newsBlocProvider = BlocProvider.of<NewsViewModel>(context);
            //  var sourceViewModel = BlocProvider.of<SourcesViewModel>(context);
            //List<SourceModel> sources =
            sourcesViewModel.getSources(categoryid: widget.categoryModel.title);
            newsViewModel.getAllNews(
                source: source, //sources[provider.currentIndex].name,
                category: widget.categoryModel.title);
                

            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: MyTheme.greenColor),
              color: currentIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              widget.sourceList[index].name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: currentIndex == index
                      ? Colors.white
                      : MyTheme.greenColor),
            ),
          )),
    );
  }
}

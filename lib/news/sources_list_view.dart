import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:news_app/helper/dialog.dart';
import 'package:news_app/modal/category_model.dart';
import 'package:news_app/modal/source_model.dart';
import 'package:news_app/news/source_cubit/sources_view_model.dart';
//import 'package:news_app/modal/source_model.dart';
import 'package:news_app/news/source_iteam.dart';
//import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/service/sources_logic.dart';
//import 'package:news_app/service/sources_logic.dart';
//import 'package:provider/provider.dart';
//import 'package:news_app/modal/source_model.dart';
//import 'package:news_app/service/sources_logic.dart';

class SourcesListView extends StatefulWidget {
  const SourcesListView({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  State<SourcesListView> createState() => _SourcesListViewState();
}

class _SourcesListViewState extends State<SourcesListView> {
  int currentindex = 0;
  SourcesViewModel viewModel = SourcesViewModel();
  List<SourceModel> sources = [];
  @override
  void initState() {
    viewModel.getSources(categoryid: widget.categoryModel.title);
   // sources = viewModel.sourcesList;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  var provider = Provider.of<NewsProvider>(context);
    return BlocBuilder<SourcesViewModel, SourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourcesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SourcesFailure) {
          return Column(
            children: [
              Text('there is an error :${state.errorMessage}'),
              ElevatedButton(
                onPressed: () {
                  viewModel.getSources(categoryid: widget.categoryModel.title);
                },
                child: Text("try again"),
              ),
            ],
          );
        } else if (state is SourcesSuccessful) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.14,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SourceIteam(
                sourceList: state.sourcesList,
                categoryModel: widget.categoryModel,
              ));
        }
        return Text('nothing');
      },
    );
    //   return  FutureBuilder(
    //     future:
    //         SourcesLogic().getAllSources(categoryId: widget.categoryModel.title),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text('there is an error :${snapshot.error.toString()}'),
    //             ElevatedButton(
    //               onPressed: () {
    //                 SourcesLogic()
    //                     .getAllSources(categoryId: widget.categoryModel.title);
    //               },
    //               child: Text("try again"),
    //             ),
    //           ],
    //         );
    //       } else if (snapshot.hasData) {
    //         List<SourceModel> sources = snapshot.data ?? [];

    //         return Container(
    //             height: MediaQuery.of(context).size.height * 0.14,
    //             padding: EdgeInsets.symmetric(horizontal: 15),
    //             child: SourceIteam(
    //               sourceList: sources,
    //               categoryModel: widget.categoryModel,
    //             ));
    //       }
    //       return Text('noThing');
    //     },
    //   );
    // }
  }
}

String source = '';

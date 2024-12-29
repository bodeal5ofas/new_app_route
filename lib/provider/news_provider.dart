import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modal/news_model.dart';
import 'package:news_app/modal/source_model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> news = [];
  List<SourceModel> sources = [];
  SourceModel currentSource = SourceModel(id: '', name: '');
  final Dio dio = Dio();
 
  
}

import 'package:dio/dio.dart';
import 'package:news_app/modal/news_model.dart';

class NewsService {
  Dio dio = Dio();
   Future<List<NewsModel>> getAllNews(
      {required String source, required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/everything?q=$category&apiKey=512ee22de8ad406e831862d334db0d09&sources=$source');
      Map<String, dynamic> jsonData = response.data;
      var jsonList = jsonData["articles"];
     List<NewsModel> news = [];
      for (var json in jsonList) {
        news.add(NewsModel.fromJson(json));
      }
    
       return news;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}

import 'package:dio/dio.dart';
import 'package:news_app/modal/source_model.dart';

class SourcesLogic {
  Dio dio = Dio();
  Future<List<SourceModel>> getAllSources({required String categoryId}) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=512ee22de8ad406e831862d334db0d09&category=$categoryId');
    Map<String, dynamic> jsonData = response.data;
    var jsonList = jsonData["sources"];
    List<SourceModel> sources = [];
    for (var json in jsonList) {
      sources.add(SourceModel.fromJson(json));
    }
    return sources;
  }
}

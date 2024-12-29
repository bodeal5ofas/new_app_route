import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modal/news_model.dart';
import 'package:news_app/service/news_service.dart';

part 'news_state.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsLoading());
 // String? cuurentSource;
 // List<NewsModel>? newsList;
  getAllNews({required String category, required String source}) async {
   // cuurentSource = source;
    try {
      emit(NewsLoading());
      List<NewsModel> news = await NewsService()
          .getAllNews(source:source!=''? source : 'ESPN', category: category);
     // newsList = news;
      emit(NewsSuccessfull(newsList: news));
    } catch (e) {
      emit(NewsFailure(errorMessage: e.toString()));
    }
  }
}

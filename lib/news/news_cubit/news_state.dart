part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsFailure extends NewsState {
  String errorMessage;
  NewsFailure({required this.errorMessage});
}

class NewsSuccessfull extends NewsState {
  List<NewsModel> newsList;
  NewsSuccessfull({required this.newsList});
}

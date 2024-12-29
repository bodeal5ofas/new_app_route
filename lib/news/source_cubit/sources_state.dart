part of 'sources_view_model.dart';

@immutable
abstract class SourcesState {}

class SourcesLoading extends SourcesState {}

class SourcesFailure extends SourcesState {
  String errorMessage;
  SourcesFailure({required this.errorMessage});
}

class SourcesSuccessful extends SourcesState {
  List<SourceModel> sourcesList;
  SourcesSuccessful({required this.sourcesList});
}

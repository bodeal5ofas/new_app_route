import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modal/source_model.dart';
import 'package:news_app/service/sources_logic.dart';

part 'sources_state.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  SourcesViewModel() : super(SourcesLoading());
 // List<SourceModel> sourcesList = [];
  getSources({required String categoryid}) async {
    try {
      emit(SourcesLoading());
      List<SourceModel> sources =
          await SourcesLogic().getAllSources(categoryId: categoryid);
   //   sourcesList = sources;
      emit(SourcesSuccessful(sourcesList: sources));
    } catch (e) {
      emit(SourcesFailure(errorMessage: e.toString()));
    }
  }
}

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {

  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {});
    on<ChangeBodyEvent>((event, emit) {emit(BodyChangeContentState(pageContent:event.pageContent,catId: event.catId,sourceId: event.sourceId,theArticle: event.selectedArticle,codeOfLanguage: event.language,query: event.searchQuery,atricleurl: event.webUrl));});
    on<ChangeAppLanguageEvent>((event, emit) {emit(ChangeAppLanguageState(newLanguageCode: event.langCode, pageContent:"home", catId: state.idOfCategory, sourceId: state.idOfSource, theArticle: state.article) );});
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return ChangeAppLanguageState(newLanguageCode: json["languageCode"], pageContent: json["contentPage"], catId: json["idOfCategory"], sourceId: json["idOfSource"], theArticle: json["article"]);
  }

  @override
  Map<String, dynamic> toJson(AppState state) {
    return {
     "contentPage":state.contentPage,
     "idOfSource":state.idOfSource,
     "idOfCategory":state.idOfCategory,
     "article":state.article,
     "languageCode":state.languageCode,
     "querySearch":state.querySearch,
     "urlOfArticle":state.urlOfArticle,
    };
  }

}
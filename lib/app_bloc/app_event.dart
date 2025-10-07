part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class ChangeBodyEvent extends AppEvent{
  final String pageContent;
  final String catId;
  final String sourceId;
  final dynamic selectedArticle;
  final String language;
  final String searchQuery;
  final String webUrl;

  ChangeBodyEvent({required this.pageContent, required this.catId,required this.sourceId,required this.selectedArticle,required this.language,required this.searchQuery,required this.webUrl});
}

class ChangeAppLanguageEvent extends AppEvent{
  final String langCode;

  ChangeAppLanguageEvent({required this.langCode});
}
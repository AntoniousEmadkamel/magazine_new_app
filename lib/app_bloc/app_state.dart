part of 'app_bloc.dart';

@immutable
abstract class AppState {
  final String contentPage;
  final String idOfSource;
  final String idOfCategory;
  final dynamic article;
  final String languageCode;
  final String querySearch;
  final String urlOfArticle;

  AppState({required this.contentPage , required this.idOfSource , required this.idOfCategory,required this.article, required this.languageCode,required this.querySearch,required this.urlOfArticle});

}

class AppInitial extends AppState {

  AppInitial():super(contentPage:"home",idOfSource: "",idOfCategory: "",article: "",languageCode: "en",querySearch: "",urlOfArticle: "");
}

class BodyChangeContentState extends AppState{
  final String pageContent;
  final String catId ;
  final String sourceId;
  final dynamic theArticle;
  final String codeOfLanguage;
  final String query;
  final String atricleurl;

  BodyChangeContentState({required this.pageContent,required this.catId,required this.sourceId,required this.theArticle,required this.codeOfLanguage,required this.query,required this.atricleurl}):super(contentPage:pageContent,idOfSource: sourceId,idOfCategory: catId,article: theArticle,languageCode: codeOfLanguage,querySearch: query,urlOfArticle:atricleurl);
}

class ChangeAppLanguageState extends AppState{
  final String newLanguageCode;
  final String pageContent;
  final String catId ;
  final String sourceId;
  final dynamic theArticle;
  ChangeAppLanguageState({required this.newLanguageCode,required this.pageContent,required this.catId,required this.sourceId,required this.theArticle}):super(languageCode: newLanguageCode,article: theArticle,idOfCategory: catId,idOfSource: sourceId,contentPage: pageContent,querySearch: "",urlOfArticle: "");

}
import 'dart:convert';
import '../../../models/news_response.dart';
import '../../../models/sources_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' ;

class ApiManager{

  static Future<SourcesModel> fetchSources(String categoryId)async{
    Uri url=Uri.https("newsapi.org", "/v2/top-headlines/sources",{"apikey":"f32db8ad7be6485cac65d71c7b855db5","category":categoryId});
    Response response=await http.get(url);
    var json=jsonDecode(response.body);
   SourcesModel sourceList=  SourcesModel.fromJson(json);
   return sourceList;
  }

  static Future<NewsResponse>fetchNews({String sourceId="",String query=""})async{
    var url =Uri.https("newsapi.org","/v2/everything",{"apiKey":"f32db8ad7be6485cac65d71c7b855db5","sources":sourceId,"q":query});
    Response response=await http.get(url);
    var json=jsonDecode(response.body);
    NewsResponse news=NewsResponse.fromJson(json);
    return news;
  }

  static Future<NewsResponse>searchNews(String query)async{
    var url =Uri.https("newsapi.org","/v2/everything",{"apiKey":"f32db8ad7be6485cac65d71c7b855db5","q":query});
    Response response=await http.get(url);
    var json=jsonDecode(response.body);
    NewsResponse news=NewsResponse.fromJson(json);
    return news;
  }


  static Future<NewsResponse> getArticles({required String requestParameter, required String stringOfRequestParameter})async{
    try{
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        "apiKey": "f32db8ad7be6485cac65d71c7b855db5",
        requestParameter: stringOfRequestParameter
      });
      Response response = await get(url);
      NewsResponse articlesResponse =
      NewsResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300 &&
          articlesResponse.articles?.isNotEmpty == true){
        return articlesResponse;
      }else {
        throw Exception("fill text formfield with you want to search for");
      }
    }catch(_){
      rethrow;
    }
}
}
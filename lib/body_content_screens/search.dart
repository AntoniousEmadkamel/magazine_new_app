import 'package:flutter/material.dart';
import 'package:magazine_new_app/shared/network/remote/api_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
    builder: (context, state) {
    return FutureBuilder(
      future: ApiManager.searchNews(state.querySearch),
      builder:  (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.data?.articles == null) {
          return Expanded(
            flex: 9,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "No articles available for your selected Source news",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          );
        }
        return ListView.separated(
           separatorBuilder: (context, index) => SizedBox(height: 15,),
          itemCount: snapshot.data?.articles?.length??0,
          itemBuilder:(context, index) =>  InkWell(
            onTap: () {
              context.read<AppBloc>().add(ChangeBodyEvent(pageContent: "article", catId: state.idOfCategory, sourceId: state.idOfSource,selectedArticle: snapshot.data?.articles?[index],language: state.languageCode,searchQuery: "",webUrl: ""));
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white,image:DecorationImage(fit: BoxFit.cover,image:AssetImage("assets/images/pattern.png"))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // color: Colors.grey.withOpacity(0.4),
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.transparent)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),child: Image.network(height: 230,fit: BoxFit.contain,snapshot.data?.articles?[index].urlToImage??""),),
                      Text(snapshot.data?.articles?[index].author??"",style: Theme.of(context).textTheme.labelSmall,),
                      Text(snapshot.data?.articles?[index].title??"",style: Theme.of(context).textTheme.labelLarge,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(snapshot.data?.articles?[index].publishedAt?.substring(0,10)??"" , style:Theme.of(context).textTheme.labelMedium ,),
                          ],
                        ),
                      ),

                    ],
                  ),),
              ),
            ),
          ),
        );
      },
    );
  },
);
  }
}
import 'package:flutter/material.dart';
import 'package:magazine_new_app/shared/network/remote/api_manager.dart';
import 'package:magazine_new_app/shared/styles/colors.dart';
import '../app_bloc/app_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeCategorized extends StatelessWidget {
  HomeCategorized({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
    builder: (context, state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Column(
        children: [
          FutureBuilder(
            future: ApiManager.fetchSources(state.idOfCategory),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }
              return Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.sources?.length ?? 0,
                  separatorBuilder: (context, index) => SizedBox(width: 5),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      context.read<AppBloc>().add(ChangeBodyEvent(pageContent:"homeCategorized",sourceId: snapshot.data?.sources?[index].id ?? "",catId: state.idOfCategory,selectedArticle: "",language: state.languageCode,searchQuery: "",webUrl: ""));
                    },
                    child: Chip(
                      side: BorderSide(color: Color(0xff39A552),width: 2),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      backgroundColor:state.idOfSource == snapshot.data!.sources![index].id ? Color(0xff39A552) : Colors.white,
                      labelStyle: state.idOfSource == snapshot.data!.sources![index].id ? const TextStyle(color: Colors.white) : Theme.of(context).textTheme.titleSmall?.copyWith(color: appbarcolor),
                      shape: const StadiumBorder(),
                      label: Text(snapshot.data?.sources?[index].name ?? ""),
                    ),
                  ),
                ),
              );
            },
          ),
          FutureBuilder(
            future: ApiManager.fetchNews(sourceId: state.idOfSource,query: state.querySearch),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
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
              return Expanded(
                flex: 9,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemCount: snapshot.data?.articles?.length ?? 0,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      context.read<AppBloc>().add(ChangeBodyEvent(pageContent: "article", catId: state.idOfCategory, sourceId: state.idOfSource,selectedArticle: snapshot.data?.articles?[index],language: state.languageCode,searchQuery: "",webUrl: ""));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CachedNetworkImage(
                              imageUrl: snapshot.data?.articles?[index].urlToImage ?? "",
                              height: 230,
                              fit: BoxFit.contain,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Text(
                              snapshot.data?.articles?[index].source?.name ?? "",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              snapshot.data?.articles?[index].title ?? "",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    snapshot.data?.articles?[index].publishedAt?.substring(0, 10) ?? "",
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  },
);
  }
}
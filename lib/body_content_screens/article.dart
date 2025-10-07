import 'package:flutter/material.dart';
import '../app_bloc/app_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Article extends StatelessWidget {
  final dynamic articles; // Change to dynamic or use your specific type
  const Article({super.key, required this.articles});
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
          Expanded(
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
                    // Use actual article image
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Image.network(
                        height: 230,
                        fit: BoxFit.contain,
                        articles?.urlToImage ?? "assets/images/ball.png",
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/images/ball.png"),
                      ),
                    ),
                    Text(
                      articles?.source?.name ?? "BBC NEWS",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      articles?.title ?? "Article Title",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            articles?.publishedAt?.substring(0, 10) ?? "3 hours ago",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      articles?.description ?? articles?.content ?? "Article content...",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(
                      onTap:() => context.read<AppBloc>().add(ChangeBodyEvent(pageContent: "web", catId: state.idOfCategory, sourceId: state.idOfSource,selectedArticle:state.article,language: state.languageCode,searchQuery: "",webUrl: articles.url??"")),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("View Full article", style: Theme.of(context).textTheme.labelLarge),
                          SizedBox(width: 18),
                          Icon(Icons.play_arrow_sharp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  },
);
  }
}
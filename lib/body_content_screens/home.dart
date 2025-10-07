import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../app_bloc/app_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
   Home({super.key});
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(AppLocalizations.of(context)!.sports, "sports", "assets/images/ball.png", Color(0xffC91C22), 1),
      CategoryModel(AppLocalizations.of(context)!.general, "general", "assets/images/Politics.png", Color(0xff003e90), 4),
      CategoryModel(AppLocalizations.of(context)!.health, "health", "assets/images/health.png", Color(0x0ffED1E79), 5),
      CategoryModel(AppLocalizations.of(context)!.business, "business", "assets/images/bussines.png", Color(0xffcf7e48), 2),
      CategoryModel(AppLocalizations.of(context)!.entertainment, "entertainment", "assets/images/environment.png", Color(0xff4882cf), 3),
      CategoryModel(AppLocalizations.of(context)!.science, "science", "assets/images/science.png", Color(0XFFF2D352), 6),
    ];

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(36),
          child: Text(
            AppLocalizations.of(context)!.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: categories.map((e) => InkWell(
              onTap: () {
                context.read<AppBloc>().add(ChangeBodyEvent(pageContent:"homeCategorized",sourceId: "",catId: e.id,selectedArticle: "",language: context.read<AppBloc>().state.languageCode,searchQuery: "",webUrl: ""));
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                shape: e.index % 2 == 0
                    ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 5),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                )
                    : OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                color: e.color,
                child: Column(
                  children: [
                    Expanded(child: Image.asset(e.image, fit: BoxFit.cover)),
                    Text(e.name, style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
            )).toList(),
          ),
        )
      ],
    );
  }
}
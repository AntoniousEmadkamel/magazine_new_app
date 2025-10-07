import 'package:flutter/material.dart';
import 'package:magazine_new_app/shared/styles/colors.dart';
import '../app_bloc/app_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/cupertino.dart';

class HomeSideMenu extends StatelessWidget {
  const HomeSideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 326,
            height: 110,
            color: appbarcolor,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.newsapp,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(height: 40),
          // Categories Menu Item
          InkWell(
            onTap: () {
              context.read<AppBloc>().add(ChangeBodyEvent(pageContent:"home",sourceId: "",catId: "",selectedArticle: "",language: context.read<AppBloc>().state.languageCode,searchQuery: "",webUrl: ""));
              Navigator.pop(context); // Close drawer
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.thList),
                  SizedBox(width: 16),
                  Text(
                    AppLocalizations.of(context)!.category,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: blacked),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // Settings Menu Item
          InkWell(
            onTap: () {
              context.read<AppBloc>().add(ChangeBodyEvent(pageContent:"settings",sourceId: "",catId: "",selectedArticle: "",language: context.read<AppBloc>().state.languageCode,searchQuery: "",webUrl: ""));
              Navigator.pop(context); // Close drawer
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  Icon(Ionicons.settings, size: 27),
                  SizedBox(width: 16),
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: blacked),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
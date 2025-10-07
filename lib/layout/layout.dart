import '../body_content_screens/home.dart';
import '../body_content_screens/home_categorized.dart';
import '../body_content_screens/search.dart';
import '../body_content_screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:magazine_new_app/app_bloc/app_bloc.dart';
import 'package:magazine_new_app/body_content_screens/article.dart';
import 'package:magazine_new_app/body_content_screens/home_side_menu.dart';
import 'package:magazine_new_app/shared/styles/colors.dart';
import 'package:magazine_new_app/body_content_screens/web_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';


class Layout extends StatelessWidget {
  Layout({super.key});
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {},
        builder: (context, state)  {
          return Scaffold(
              drawer: state.contentPage=="search"?null: Drawer(child: HomeSideMenu(),),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                actions: [
                  state.contentPage=="search"? SizedBox.shrink(): state.contentPage=="home"?SizedBox.shrink():InkWell(
                    onTap:  () {
                      context.read<AppBloc>().add(ChangeBodyEvent(pageContent:"search",sourceId: "",catId: "",selectedArticle: "",language: "en",searchQuery: searchController.text,webUrl: ""));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 23.0),
                      child: Icon(FeatherIcons.search,size: 27,),
                    ),
                  ),
                ],
                toolbarHeight: 67,
                centerTitle: true,
                title: state.contentPage=="search"?TextFormField(
                  controller: searchController,
                  onFieldSubmitted:(value) {
                    searchController.text=value;
                    if (value.trim().isNotEmpty) {
                      context.read<AppBloc>().add(ChangeBodyEvent(
                          searchQuery: searchController.text,
                          language: state.languageCode,
                          selectedArticle: state.article,
                          catId: state.idOfCategory,
                          sourceId: state.idOfSource,
                          pageContent: "search",
                          webUrl: ""
                      )
                      );
                    }
                  } ,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 37,vertical: 8),
                    prefixIcon: InkWell(onTap: () {
                      context.read<AppBloc>().add(ChangeBodyEvent(pageContent:"home",sourceId: "",catId: "",selectedArticle: "",language: "en",searchQuery: "",webUrl: ""));
                    },child: Icon(Ionicons.close,size: 21,color: appbarcolor,)),
                    suffixIcon: Icon(FeatherIcons.search,size: 21,color: appbarcolor,),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search Article",
                    hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: appbarcolor,fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ):state.contentPage=="article"?Text(state.article.title as String, style: Theme.of(context).textTheme.titleLarge) :Text(AppLocalizations.of(context)!.newsapp ,style: Theme.of(context).textTheme.titleLarge),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                backgroundColor: Colors.green,
              ),
              body:state.contentPage=='home'?Home():
              state.contentPage== 'homeCategorized'?HomeCategorized():
              state.contentPage== 'settings'?Settings():
              state.contentPage== 'search'? Search():
              state.contentPage=="article"?Article(articles:state.article):state.contentPage=="web"?WebScreen():SizedBox.shrink()
          );
        },
      ),
    );
  }
}
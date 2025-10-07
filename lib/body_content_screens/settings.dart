import 'package:flutter/material.dart';
import 'package:magazine_new_app/app_bloc/app_bloc.dart';
import 'package:magazine_new_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,image:DecorationImage(fit: BoxFit.cover,image:AssetImage("assets/images/pattern.png"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(29.0),
            child:Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headlineMedium,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  30.0),
            child: DropdownMenu(
                textStyle: Theme.of(context).textTheme.headlineSmall ,
                inputDecorationTheme:  InputDecorationTheme(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appbarcolor,width: 1)) ,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appbarcolor,width: 1)) ,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 16.0),
                    border: OutlineInputBorder(borderSide: BorderSide(color: appbarcolor,width: 1))
                ),
                width:319,
                trailingIcon: Icon(Icons.keyboard_arrow_down_outlined,color: appbarcolor,),
                initialSelection:context.read<AppBloc>().state.languageCode,
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                      labelWidget: InkWell( onTap: () => context.read<AppBloc>().add(ChangeAppLanguageEvent(langCode: "en")),child: Text(selectionColor: Colors.black,AppLocalizations.of(context)!.english,style: Theme.of(context).textTheme.titleMedium,)),
                      label: AppLocalizations.of(context)!.english,
                      value: "en"

                  ),
                  DropdownMenuEntry(
                      labelWidget: InkWell( onTap: () => context.read<AppBloc>().add(ChangeAppLanguageEvent(langCode: "ar")),child: Text(selectionColor: Colors.black,AppLocalizations.of(context)!.arabic,style: Theme.of(context).textTheme.titleMedium,)),
                      label: AppLocalizations.of(context)!.arabic,
                      value: "ar"
                  )
                ]
            ),
          )
        ],
      ),
    );
  }
}
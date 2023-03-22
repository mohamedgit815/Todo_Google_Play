
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/View/Drawer/init_drawer_state.dart';

abstract class BaseDrawerState {
  Future<void> switchLang({
    required BuildContext context ,
    required WidgetRef ref ,
    required InitDrawer state
  });

  PreferencesBooleanProvider switchThemeProvider({required WidgetRef ref});
}

class DrawerState implements BaseDrawerState {
  @override
  Future<void> switchLang({
    required BuildContext context ,
    required WidgetRef ref ,
    required InitDrawer state
  }) async {
    return await App.alertWidgets.alertDialog(context: context, builder: (buildContext){
      return SimpleDialog(
        title: App.text.text("${context.lang!.translate(LangEnum.lang.name)}") ,
        children: [
          App.buttons.elevated(onPressed: () async {
            return await _switchLang(context: context, ref: ref, lang: LangEnum.ar.name);
          }, child: App.text.text("${context.lang!.translate(LangEnum.ar.name)}")) ,
          App.buttons.elevated(onPressed: () async {
            return await _switchLang(context: context, ref: ref, lang: LangEnum.en.name);
          }, child: App.text.text("${context.lang!.translate(LangEnum.en.name)}")) ,
          App.buttons.elevated(onPressed: () async {
            return await _switchLang(context: context, ref: ref, lang: LangEnum.es.name);
          }, child: App.text.text("${context.lang!.translate(LangEnum.es.name)}")) ,
        ],
      );
    }).then((value) async {
      await App.navigator.backPageRouter(context: context);
    });
  }

  Future<void> _switchLang({
    required BuildContext context ,
    required WidgetRef ref ,
    required String lang
  }) async {
    ref.read(App.localization.langProvider).toggleLang(lang);
    await App.navigator.backPageRouter(context: context);
  }

  @override
  PreferencesBooleanProvider switchThemeProvider({required WidgetRef ref}) {
    return ref.read(App.theme.themeProvider).toggleTheme();
  }


}
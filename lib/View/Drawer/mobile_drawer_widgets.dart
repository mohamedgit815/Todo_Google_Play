import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/View/Drawer/init_drawer_state.dart';

abstract class BaseMobileDrawerWidgets {
  Text textLang({required BuildContext context});
  Text textTheme({required BuildContext context , required WidgetRef ref});

  MenuItemButton buildButtonTheme({
    required BuildContext context ,
    required WidgetRef ref ,
    required InitDrawer state
  });

  MenuItemButton buildButtonLang({
    required BuildContext context ,
    required WidgetRef ref ,
    required InitDrawer state
  });
}

class MobileDrawerWidgets implements BaseMobileDrawerWidgets {
  @override
  Text textLang({required BuildContext context}) {
    return App.text.text(
        "${context.lang!.translate(LangEnum.lang.name)}" ,
        color: App.color.generalWhite ,
        fontSize: 20.0
    );
  }


  @override
  Text textTheme({
    required BuildContext context ,
    required WidgetRef ref
  }) {
    return App.text.text(
      ref.read(App.theme.themeProvider).darkTheme ?
      "${context.lang!.translate(LangEnum.light.name)}"
          :
      "${context.lang!.translate(LangEnum.dark.name)}" ,
      color: App.color.generalWhite ,
      fontSize: 20.0 ,
    );
  }


  @override
  MenuItemButton buildButtonTheme({
    required BuildContext context ,
    required WidgetRef ref ,
    required InitDrawer state
  }) {
    return MenuItemButton(
        onPressed: () {
          state.main.switchThemeProvider(ref: ref);
        },
        trailingIcon: Consumer(
            builder: (BuildContext context,WidgetRef prov,Widget? _) {
              return Switch.adaptive(
                  value: prov.watch(App.theme.themeProvider).darkTheme ,
                  onChanged: (v) {
                    state.main.switchThemeProvider(ref: prov);
                  });
            }
        ),
        child: state.mobile.textTheme(context: context, ref: ref)
    );
  }


  @override
  MenuItemButton buildButtonLang({
    required BuildContext context ,
    required WidgetRef ref ,
    required InitDrawer state
  }) {
    return MenuItemButton(
        onPressed: () async {
          return await state.main.switchLang(
              context: context ,
              ref: ref ,
              state: state
          );
        },
        child: state.mobile.textLang(context: context)
    );
  }
}
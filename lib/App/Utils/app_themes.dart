import 'package:flutter/material.dart';
import 'package:todo_app/App/app.dart';

abstract class BaseAppThemes {

  /// This is for Dark Theme
  ThemeData darkThemeData({required App app});

  /// This is for Light Theme
  ThemeData lightThemeData({required App app});

}


class AppThemes extends BaseAppThemes {

  @override
  ThemeData darkThemeData({required App app}) {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark ,
        primaryColor: app.color.darkMainColor ,
        primaryColorDark: app.color.darkMainColor ,
        useMaterial3: true ,

        inputDecorationTheme: InputDecorationTheme(
          focusColor: app.color.darkMainColor ,
          hoverColor: app.color.darkMainColor ,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: app.color.darkMainColor)
            )
        ) ,

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(app.color.darkMainColor) ,
              foregroundColor: MaterialStateProperty.all<Color>(app.color.generalWhite)
          )
        ),

        iconTheme: IconThemeData(
            color: app.color.darkMainColor ,
            size: 25.0
        ) ,


        primaryIconTheme: IconThemeData(
          color: app.color.darkMainColor ,
          size: 25.0
        ) ,


        appBarTheme: AppBarTheme(
          backgroundColor: app.color.darkColorOne ,
          foregroundColor: app.color.generalWhite ,
          elevation: 0 ,
          actionsIconTheme: IconThemeData(
              color: app.color.generalWhite ,
              size: 25.0
          )
        ) ,


        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: app.color.darkMainColor ,
          foregroundColor: app.color.generalWhite
      )
    );
  }

  @override
  ThemeData lightThemeData({required App app}) {
    return ThemeData(
      useMaterial3: true ,

      brightness: Brightness.light ,

      primaryColor: app.color.lightMainColor ,

      /// Icon & appBar
      iconTheme: IconThemeData(
            color: app.color.lightMainColor ,
            size: 25.0
        ) ,
      primaryIconTheme: IconThemeData(
            color: app.color.lightMainColor ,
            size: 25.0
        ) ,
      appBarTheme: AppBarTheme(
            backgroundColor: app.color.lightMainColor ,
            foregroundColor: app.color.generalWhite ,
            elevation: 0 ,
            iconTheme: IconThemeData(
                color: app.color.generalWhite ,
                size: 25.0
            ) ,
            actionsIconTheme: IconThemeData(
                color: app.color.generalWhite ,
                size: 25.0
            ) ,
        ) ,


      /// Buttons
      iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(20.0) ,
              iconColor: MaterialStateProperty.all(app.color.lightMainColor) ,
              foregroundColor: MaterialStateProperty.all(app.color.darkMainColor) ,
              //backgroundColor: MaterialStateProperty.all(app.color.generalWhite) ,
            )
        ) ,
      progressIndicatorTheme: ProgressIndicatorThemeData(
            color: app.color.lightMainColor
        ) ,
      elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(app.color.lightMainColor) ,
                foregroundColor: MaterialStateProperty.all<Color>(app.color.generalWhite)
            )
        ) ,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: app.color.lightMainColor ,
            foregroundColor: app.color.generalWhite
        ) ,

      /// General
      cardTheme: CardTheme(
            color: app.color.generalWhite
        ) ,
      inputDecorationTheme: InputDecorationTheme(
            focusColor: app.color.lightMainColor ,
            hoverColor: app.color.lightMainColor ,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: app.color.lightMainColor)
            )
        ) ,
      listTileTheme: ListTileThemeData(
          textColor: app.color.lightMainColor ,
          iconColor: app.color.generalWhite ,
      ) ,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(app.color.darkMainColor),
        trackColor: MaterialStateProperty.all(app.color.generalGrey.shade300) ,

      ) ,


    );
  }
}
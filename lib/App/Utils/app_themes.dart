import 'package:flutter/material.dart';
import 'package:todo_app/App/app.dart';

abstract class BaseAppThemes {
  /// This is for Dark Theme
  ThemeData darkThemeData();

  /// This is for Light Theme
  ThemeData lightThemeData();

}

class AppThemes extends BaseAppThemes {

  @override
  ThemeData darkThemeData() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark ,
        primaryColor: App.color.darkMainColor ,
        primaryColorDark: App.color.darkMainColor ,


        inputDecorationTheme: InputDecorationTheme(
          focusColor: App.color.darkMainColor ,
          hoverColor: App.color.darkMainColor ,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: App.color.darkMainColor)
            )
        ) ,

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(App.color.darkMainColor) ,
              foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite)
          )
        ),

        iconTheme: IconThemeData(
            color: App.color.darkMainColor ,
            size: 25.0
        ) ,


        primaryIconTheme: IconThemeData(
          color: App.color.darkMainColor ,
          size: 25.0
        ) ,


        appBarTheme: AppBarTheme(
          backgroundColor: App.color.darkColorOne ,
          foregroundColor: App.color.generalWhite ,
          elevation: 0 ,
          actionsIconTheme: IconThemeData(
              color: App.color.generalWhite ,
              size: 25.0
          )
        ) ,


        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: App.color.darkMainColor ,
          foregroundColor: App.color.generalWhite
      )
    );
  }

  @override
  ThemeData lightThemeData() {
    // TODO: implement lightThemeData
    throw UnimplementedError();
  }
}
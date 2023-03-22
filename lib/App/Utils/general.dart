import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/app_localization.dart';


/// Enums
enum GeneralEnum {
  todo
}


enum ModelEnum {

  /// Models
  id ,
  title ,
  content ,
  date ,
  checkTitleDirection ,
  checkContentDirection ,

}


enum PreferencesEnum {
  /// Shared Preferences
  preferencesLang ,
  preferencesTheme
}


enum StorageKeyEnum {
  pageStorageKeyHome
}


enum RestorationEnum {
  /// Restoration
  updateTodoScreenRestoration ,
  updateTitleRestorationId ,
  updateContentRestorationId ,
  createTodoRestoration ,
  createTitleRestorationId ,
  createContentRestorationId
}

enum LangEnum {
  ar , en , es ,
  createScreen ,
  homeScreen ,
  updateScreen ,
  createContent ,
  lang , light , dark
}


/// Extension For BuildContext
extension MainContext on BuildContext {
  AppLocalization? get lang => AppLocalization.of(this);
  ThemeData get theme => Theme.of(this);
  bool get isDark => (theme.brightness == Brightness.dark); /// To Check Theme is Dark or Light
  ModalRoute<Object?>? get modal => ModalRoute.of(this);
  bool get keyBoard => MediaQuery.of(this).viewInsets.bottom == 0; /// To Check KeyBoard Hide or No
  Size get mainSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  NavigatorState get navigator => Navigator.of(this);
  ScaffoldState get scaffoldState => Scaffold.of(this);
}


/// Animated Conditional
class AnimatedConditional extends StatelessWidget {
  final Widget first , second;
  final bool state;
  final Alignment? alignment;
  final Duration? duration , reverseDuration;
  final Curve? firstCurve , secondCurve , sizeCurve;

  const AnimatedConditional({
    Key? key ,
    required this.state ,
    required this.first ,
    required this.second ,
    this.duration ,
    this.reverseDuration ,
    this.alignment ,
    this.sizeCurve ,
    this.firstCurve ,
    this.secondCurve

  }) : super(key: key);

  @override
  AnimatedCrossFade build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: first ,
      secondChild: second ,
      crossFadeState: state ? CrossFadeState.showFirst : CrossFadeState.showSecond ,
      secondCurve: secondCurve ?? Curves.linear ,
      sizeCurve: sizeCurve ?? Curves.linear ,
      firstCurve: firstCurve ?? Curves.linear,
      duration: duration ?? const Duration(milliseconds: 300),
      reverseDuration: reverseDuration ?? duration ,
      alignment: alignment ?? Alignment.topCenter ,
    );
  }
}


/// Text
class CustomText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  const CustomText({
    Key? key,
    this.decoration,
    required this.text,
    this.maxLine,
    this.style,
    this.overflow,
    this.fontSize,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  @override
  Text build(BuildContext context) {

    return Text(
        text ,
        //textDirection: TextDirection.ltr,
        style: style ??  TextStyle(
            fontFamily: 'Lato',
            fontSize: fontSize ?? 15.0,
            fontWeight: fontWeight ,
            color: color,
            decoration: decoration ?? TextDecoration.none
        ),
        textScaleFactor: 1.0 ,
        maxLines: maxLine ?? 1 ,
        overflow: overflow ?? TextOverflow.ellipsis
    );
  }
}


import 'package:flutter/material.dart';

abstract class BaseTextWidgets {

  Text text(String text , {
    int? maxLine ,
    TextStyle? style ,
    TextOverflow? overflow ,
    double? fontSize ,
    FontWeight? fontWeight ,
    Color? color ,
    TextDecoration? decoration
  });


  AnimatedDefaultTextStyle animatedText({
    required String text ,
    int? maxLine ,
    TextStyle? style ,
    TextOverflow? overflow ,
    double? fontSize ,
    FontWeight? fontWeight ,
    Color? color ,
    TextDecoration? decoration
  });


  AnimatedCrossFade condition({
    required Widget first , required Widget second,
    required bool state ,
    Alignment? alignment,
    Duration? duration , reverseDuration ,
    Curve? firstCurve , Curve? secondCurve , Curve? sizeCurve
  });

}


class TextWidget implements BaseTextWidgets {

  @override
  Text text(String text , {
    int? maxLine ,
    TextStyle? style ,
    TextOverflow? overflow ,
    double? fontSize ,
    FontWeight? fontWeight ,
    Color? color ,
    TextDecoration? decoration
  }) {
    return Text(
        text ,
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


  @override
  AnimatedDefaultTextStyle animatedText({
    required String text ,
    int? maxLine ,
    TextStyle? style ,
    TextOverflow? overflow ,
    double? fontSize ,
    FontWeight? fontWeight ,
    Color? color ,
    TextDecoration? decoration
  }) {
    return AnimatedDefaultTextStyle(
      maxLines: maxLine ?? 1 ,
      style: style ?? TextStyle(
          fontFamily: 'Poppins',
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight ,
          overflow: overflow ?? TextOverflow.ellipsis ,
          decoration: decoration ?? TextDecoration.none
      ),
      duration: const Duration(milliseconds: 300),
      child: Text(
        text,
        textScaleFactor: 1.0 ,
      ),
    );
  }


  @override
  AnimatedCrossFade condition({
    required Widget first , required Widget second,
    required bool state ,
    Alignment? alignment,
    Duration? duration , reverseDuration ,
    Curve? firstCurve , Curve? secondCurve , Curve? sizeCurve
}) {
    return AnimatedCrossFade(
        firstChild: first ,
        secondChild: second ,
        crossFadeState: state ? CrossFadeState.showFirst : CrossFadeState.showSecond ,
        secondCurve: secondCurve ?? Curves.linear ,
        sizeCurve: sizeCurve ?? Curves.linear ,
        firstCurve: firstCurve ?? Curves.linear,
        duration: duration ?? const Duration(milliseconds: 300),
    reverseDuration: reverseDuration ?? duration ,
    alignment: alignment ?? Alignment.topCenter
    );
  }


}
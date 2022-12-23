import 'package:flutter/material.dart';

/// Extension For BuildContext
extension MainContext on BuildContext {
//  AppLocalization? get translate => AppLocalization.of(this);
  ThemeData get theme => Theme.of(this);
  ModalRoute<Object?>? get modal => ModalRoute.of(this);
  bool get keyBoard => MediaQuery.of(this).viewInsets.bottom == 0;
  Size get mainSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

class CustomWidgets {
  ScaffoldMessengerState customSnackBar({
    required String text,
    required BuildContext context ,
    final BorderRadius? borderRadius ,
    final EdgeInsets? padding ,
    final Duration? duration ,
    final SnackBarAction? snackBarAction
  }) {
    return ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
        SnackBar(
            content: CustomText(text: text),
            shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(0.0)),
            padding: padding ,
            duration: duration ?? const Duration(seconds: 1) ,
            action: snackBarAction
        ));
  }


  Future<void> customAlertDialog({
    required VoidCallback onPressed ,
    required BuildContext context
  }){
    return showDialog(context: context, builder: (buildContext)=>AlertDialog(
      title: const CustomText(text: 'Sure'),
      //title: CustomText(text: '${context.translate!.translate(MainEnum.textSure.name)}'),
      actions: [
        CustomElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, child: const Text('No')),
        //child: Text('${context.translate!.translate(MainEnum.textNo.name)}')),
        CustomElevatedButton(
            onPressed: onPressed, child: const Text('Yes')),
      ],
    ));
  }


  Future<void> customModalBottomSheet({
    required Widget widgets ,
    required BuildContext context
  }) async {
    return await showModalBottomSheet(context: context, builder: (buildContext)=>widgets);
  }


  ScaffoldMessengerState customMaterialBanner({
    required BuildContext context ,
    required String text ,
    required List<Widget> actions ,
    Widget? leading
  }) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(MaterialBanner(
          leading: leading ,
          content: Text(text) ,
          actions: actions
      ));
  }

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


class AnimatedText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;
  const AnimatedText({Key? key,this.decoration,required this.text, this.maxLine, this.style, this.overflow, this.fontSize, this.fontWeight, this.color,}) : super(key: key);

  @override
  AnimatedDefaultTextStyle build(BuildContext context) {
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

}

/// Buttons
class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;

  const CustomTextButton({
    Key? key,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.size,
    this.backGroundColor ,
    required this.onPressed,
    required this.child
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          backgroundColor: backGroundColor,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        child: child
    );
  }
}


class CustomTextIconButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final Icon icon ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;

  const CustomTextIconButton({
    Key? key ,
    this.padding ,
    this.elevation ,
    this.borderRadius ,
    this.size ,
    this.backGroundColor ,
    required this.onPressed,
    required this.child ,
    required this.icon ,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          backgroundColor: backGroundColor,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        icon: icon,
        label: child
    );
  }
}


class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;
  final BorderSide? borderSide ;

  const CustomOutlinedButton({
    Key? key,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.size,
    this.backGroundColor ,
    required this.onPressed,
    required this.child,
    this.borderSide
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          side: borderSide,
          backgroundColor: backGroundColor,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        child: child
    );
  }
}


class CustomOutlinedIconButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final Icon icon ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;
  final BorderSide? borderSide;

  const CustomOutlinedIconButton({
    Key? key,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.size,
    this.backGroundColor ,
    required this.onPressed,
    required this.child,
    this.borderSide ,
    required this.icon
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: padding,
        elevation: elevation,
        minimumSize: size,
        side: borderSide,
        backgroundColor: backGroundColor,
        textStyle: const TextStyle(fontSize: 17.0),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(0)
        ),
      ) ,
      onPressed: onPressed ,
      icon: icon ,
      label: child ,
    );
  }
}


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Color? backGroundColor ;
  final Size? size ;

  const CustomElevatedButton({
    Key? key,
    this.padding,
    this.backGroundColor,
    this.elevation,
    this.borderRadius,
    this.size,
    required this.onPressed,
    required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        child: child
    );

  }
}


class CustomElevatedIconButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final Icon icon ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;
  final BorderSide? borderSide;


  const CustomElevatedIconButton({
    Key? key ,
    this.padding ,
    this.elevation ,
    this.borderRadius ,
    this.size ,
    this.backGroundColor ,
    required this.onPressed ,
    required this.child ,
    this.borderSide ,
    required this.icon
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        icon: icon ,
        label: child
    );
  }
}
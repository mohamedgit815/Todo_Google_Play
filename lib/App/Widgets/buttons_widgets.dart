import 'package:flutter/material.dart';

abstract class BaseButtonsWidgets {
  TextButton text({
    required VoidCallback onPressed ,
    required Widget child ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
});

  TextButton textIcon({
    required VoidCallback onPressed ,
    required Widget child ,
    required Icon icon ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
  });


  OutlinedButton outline({
    required VoidCallback onPressed ,
    required Widget child ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
  });

  OutlinedButton outlineIcon({
    required VoidCallback onPressed ,
    required Widget child ,
    required Icon icon ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
  });


  ElevatedButton elevated({
    required VoidCallback onPressed ,
    required Widget child ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Color? backGroundColor ,
    Size? size
  });

  ElevatedButton elevatedIcon({
    required VoidCallback onPressed ,
    required Widget child ,
    required Icon icon ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Color? backGroundColor ,
    Size? size
  });

}

class ButtonsWidgets implements BaseButtonsWidgets {
  @override
  TextButton text({
    required VoidCallback onPressed ,
    required Widget child ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
  }) {
    return TextButton(
      onPressed: onPressed,
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
      child: child ,
    );
  }

  @override
  TextButton textIcon({
    required VoidCallback onPressed ,
    required Widget child ,
    required Icon icon ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
  }) {
    return TextButton.icon(
      onPressed: onPressed,
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
      label: child,
      icon: icon ,
    );
  }




  @override
  OutlinedButton outline({
    required VoidCallback onPressed ,
    required Widget child ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
  }) {
    return OutlinedButton(
      onPressed: onPressed,
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
      child: child ,
    );
  }


  @override
  OutlinedButton outlineIcon({
    required VoidCallback onPressed ,
    required Widget child ,
    required Icon icon ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Size? size ,
    Color? backGroundColor
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
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
      label: child ,
      icon: icon ,
    );
  }


  @override
  ElevatedButton elevated({
  required VoidCallback onPressed ,
  required Widget child ,
  EdgeInsets? padding ,
  double? elevation ,
  BorderRadius? borderRadius ,
  Color? backGroundColor ,
  Size? size
  }) {
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


  @override
  ElevatedButton elevatedIcon({
    required VoidCallback onPressed ,
    required Widget child ,
    required Icon icon ,
    EdgeInsets? padding ,
    double? elevation ,
    BorderRadius? borderRadius ,
    Color? backGroundColor ,
    Size? size
  }) {
    return ElevatedButton.icon(
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
        label: child ,
      icon: icon ,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/responsive_builder.dart';

abstract class BasePackagesWidgets {
  /// Function App for Packages

  // Package ResponsiveBuilder
  ResponsiveBuilderScreen responsiveBuilderScreen({
    required Widget mobile ,
    Widget? tablet ,
    Widget? deskTop
  });

}


class PackagesWidgets implements BasePackagesWidgets {

  @override
  ResponsiveBuilderScreen responsiveBuilderScreen({
    required Widget mobile ,
    Widget? tablet ,
    Widget? deskTop
  }) {
    return ResponsiveBuilderScreen(
      mobile: mobile ,
      tablet: tablet ?? mobile ,
      deskTop:deskTop ?? mobile ,
    );
  }


}
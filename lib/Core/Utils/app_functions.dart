import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/app_colors.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';


class AppGeneral {

  Center errorProvider(Object err){
    return Center(child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomText(text: err.toString())),);
  }

  Center loadingProvider(){
    return const Center(child: CircularProgressIndicator.adaptive(),);
  }

  Visibility loadingVisibilityProvider(){
    return const Visibility(
        visible: false,
        child: CircularProgressIndicator.adaptive());
  }

  Center notFoundData(String text){
    return Center(child: FittedBox(
      fit: BoxFit.scaleDown,
      child: CustomText(
        text: text ,
        fontSize: 20.0,
        color: AppColor().lightMainColor,
      ),
    ),);
  }

  MaterialStateProperty<Color> materialStateColor(Color color){
    return MaterialStateProperty.all<Color>(color);
  }
}
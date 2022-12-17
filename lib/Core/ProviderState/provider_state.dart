import 'package:flutter/material.dart';


class ProviderState extends ChangeNotifier {

  /// List for Bottom Navigation Bar
  final List<Widget> pages = const [
    // MainHomeScreen() ,
    // MainFriendsScreen() ,
  ];


  /// Boolean
  bool boolean = true;

  bool switchBoolean(){
    notifyListeners();
    return boolean = !boolean;
  }

  bool trueBoolean(){
    notifyListeners();
    return boolean = true;
  }

  bool falseBoolean(){
    notifyListeners();
    return boolean = false;
  }


  /// Strings
  String strings = '';

  String equalValueString(String v){
    notifyListeners() ;
    return strings = v;
  }

  void equalStringNull(){
    strings = '';
    notifyListeners();
  }


  /// Integer
  int integer = 0;

  int equalValueInteger(int v) {
    notifyListeners();
    return integer = v;
  }

//File? fileImage;
// Future<void> getImagePicker({required BuildContext context,required ImageSource imageSource}) async {
  //   try {
  //     final XFile? image = await ImagePicker().pickImage(source: imageSource);
  //
  //     if (image != null) {
  //       fileImage = File(image.path);
  //     }
  //     else {
  //       customSnackBar(text: 'your arn\'t selected Image', context: context);
  //     }
  //     notifyListeners();
  //   }on PlatformException catch(_) {
  //     customSnackBar(text: 'your arn\'t selected Image', context: context);
  //   }
  // }
  //
  // void deleteImagePicker(){
  //   fileImage = null;
  //   notifyListeners();
  // }
  //
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';


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

class BottomBarState extends ChangeNotifier {

  /// List for Bottom Navigation Bar
  final List<Widget> pages = const [
    // MainHomeScreen() ,
    // MainFriendsScreen() ,
  ];

  /// Integer
  int integer = 0;

  int equalValueInteger(int v) {
    notifyListeners();
    return integer = v;
  }
}

class BooleanState extends ChangeNotifier {
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
}

class IntegerState extends ChangeNotifier {
  /// Integer
  int integer = 0;

  int equalValueInteger(int v) {
    notifyListeners();
    return integer = v;
  }
}

class StringState extends ChangeNotifier {
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
}

class PreferencesState extends ChangeNotifier {
  /// To Load Data by Shared Preferences

  late String _key;
  SharedPreferences? _prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  PreferencesState(String key) {
    _darkTheme = true;
    _key = key;
    _loadFromPrefs();
  }


  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }


  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }


  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs!.getBool(_key) ?? true;
    notifyListeners();
  }


  _saveToPrefs() async {
    await _initPrefs();
    await _prefs!.setBool(_key, _darkTheme);
  }
}

class PreferencesStringState extends ChangeNotifier {
  late SharedPreferences _prefs;
  late String _lang;
  late String _key;
  String get lang => _lang;


  PreferencesStringState({required String key , required String defaultName}) {
    _lang = defaultName;
    _key = key;
    _loadFromPrefs();
  }


  toggleLang(String langV) {
    _lang = langV;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _lang = _prefs.getString(_key) ?? LangEnum.en.name;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    await _prefs.setString(_key, _lang);
  }
}

class PreferencesBooleanState extends ChangeNotifier {
  /// To Load Data by Shared Preferences

  late String _key;
  SharedPreferences? _prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  PreferencesBooleanState(String key) {
    _darkTheme = true;
    _key = key;
    _loadFromPrefs();
  }


  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }


  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }


  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs!.getBool(_key) ?? true;
    notifyListeners();
  }


  _saveToPrefs() async {
    await _initPrefs();
    await _prefs!.setBool(_key, _darkTheme);
  }
}

class ImagePickerState extends ChangeNotifier {
  /// To Get Images from Gallery or Camera

  //File? fileImage;
  //Future<void> getImagePicker({required BuildContext context,required ImageSource imageSource}) async {
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
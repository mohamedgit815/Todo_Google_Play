class AppStrings {
   final AppConstance constance = AppConstance();
   final AppLanguages languages = AppLanguages();
}


class AppConstance {
  /// Constance
  final String constId = "id"; /// Don't Change That Never


  /// Add Here Name Languages
  final String arabic = 'عربي';
  final String english = "English";


  /// Shared Preferences
  final String preferencesLang = "Lang";


  /// PageStorageKey
  final String pageStorageKeyHome = "MainHomePageScreenKey";


  /// Restoration
  //final String mainHomePageRestoration = "MainHomePageRestorationId";
  final String updateTodoRestoration = "UpdateTodoScreenRestoration";
  final String updateTitleRestorationId = "UpdateTitleRestorationId";
  final String updateContentRestorationId = "UpdateContentRestorationId";
  final String createTodoRestoration = "CreateTodoRestoration";
  final String createTitleRestorationId = "CreateTitleRestorationId";
  final String createContentRestorationId = "CreateContentRestorationId";

}


class AppLanguages {
  /// SnackBar
  final String createScreenSuccess = 'Created';
  final String createScreenError = 'is Empty';
  final String homeScreenDeleted = 'Item is Deleted';
  final String updateSuccess = "Item Updated";
  final String updateError = "Error";

  /// Alert Dialog
  final String saveDialog = "Do you want to Save ?";
  final String deleteDialog = "You will delete Item ?";
  final String sureDialog = "Are you sure ?";

  /// AppBar Text
  final String appbarHomeScreen = "Home Screen";
  final String appbarCreateScreen = "Create Screen";
  final String appbarUpdateScreen = "Update Screen";
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/Utils/provider_state.dart';


class GlobalVariable  {
  /// Riverpod for Languages
  final ProviderListenable<PreferencesStringState> langProvider =
  ChangeNotifierProvider((ref) => PreferencesStringState(
      key: PreferencesEnum.preferencesLang.name ,
      defaultName: LangEnum.en.name
  ));


}
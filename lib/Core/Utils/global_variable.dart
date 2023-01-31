import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/Core/Utils/general.dart';


class GlobalVariable  {
  /// Riverpod for Languages
  final ProviderListenable<PreferencesStringState> langProvider =
  ChangeNotifierProvider((ref) => PreferencesStringState(
      key: PreferencesEnum.preferencesLang.name ,
      defaultName: LangEnum.en.name
  ));


}
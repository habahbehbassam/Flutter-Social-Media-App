import 'package:flutter/widgets.dart';

abstract class SelectedLanguageState {
  SelectedLanguageState([List props = const <dynamic>[]]);
}

class Empty extends SelectedLanguageState {}
class Loading extends SelectedLanguageState {}

class Loaded extends SelectedLanguageState {
  final Locale selectedLanguage;

  Loaded(this.selectedLanguage) : super([selectedLanguage]);
}
class NewLanguageSelected extends SelectedLanguageState {
  final Locale selectedLanguage;

  NewLanguageSelected(this.selectedLanguage) : super([selectedLanguage]);
}

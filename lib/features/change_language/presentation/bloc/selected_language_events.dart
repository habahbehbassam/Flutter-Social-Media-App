abstract class SelectedLanguageEvent {
  SelectedLanguageEvent([List props = const <dynamic>[]]);
}

class GetSelectedLanguageEvent extends SelectedLanguageEvent {
  GetSelectedLanguageEvent() : super();
}

class ChangeSelectedLanguageEvent extends SelectedLanguageEvent {
  ChangeSelectedLanguageEvent() : super();
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_app/core/usecase/usecase.dart';
import 'package:flutter_social_media_app/features/change_language/domain/usecases/cache_selected_language.dart';
import 'package:flutter_social_media_app/features/change_language/presentation/bloc/selected_language_events.dart';
import 'package:flutter_social_media_app/features/change_language/presentation/bloc/selected_language_state.dart';
import '../../domain/usecases/get_selected_language.dart';

const englishLanguage = 'en';
const arabicLanguage = 'ar';

class SelectedLanguageBloc
    extends Bloc<SelectedLanguageEvent, SelectedLanguageState> {
  final GetSelectedLanguage getSelectedLanguage;
  final CacheSelectedLanguage cacheSelectedLanguage;

  SelectedLanguageBloc({
    required this.getSelectedLanguage,
    required this.cacheSelectedLanguage,
  }) : super(Empty()) {
    on<GetSelectedLanguageEvent>(
      (event, emit) => _handleOnSelectedLanguageCalled(event, emit),
    );
    on<ChangeSelectedLanguageEvent>(
      (event, emit) => _handleOnCacheSelectedLanguageCalled(event, emit),
    );
  }

  _handleOnSelectedLanguageCalled(
    GetSelectedLanguageEvent event,
    Emitter<SelectedLanguageState> emit,
  ) async {
    final failureOrSelectedLanguage = await getSelectedLanguage.call(
      NoParams(),
    );
    emit(
      failureOrSelectedLanguage.fold(
        (failure) => Loaded(
          const Locale('en'),
        ),
        (selectedLanguage) => Loaded(
          Locale(
            selectedLanguage.selectedLanguage,
          ),
        ),
      ),
    );
  }

  _handleOnCacheSelectedLanguageCalled(
    ChangeSelectedLanguageEvent event,
    Emitter<SelectedLanguageState> emit,
  ) async {
    emit(Loading());
    final oldLanguage = await getSelectedLanguage.call(NoParams());
    oldLanguage.fold(
      (failure) async {
         _cacheNewSelectedLanguage(arabicLanguage);
        emit(NewLanguageSelected(const Locale(arabicLanguage)));
      },
      (selectedLanguage) async {
        final newSelectedLanguage =
            selectedLanguage.selectedLanguage == englishLanguage
                ? arabicLanguage
                : englishLanguage;
         _cacheNewSelectedLanguage(newSelectedLanguage);
        emit(NewLanguageSelected(Locale(newSelectedLanguage)));
      },
    );
  }

  _cacheNewSelectedLanguage(String selectedLanguage) {
    return cacheSelectedLanguage.call(Params(selectedLanguage));
  }
}

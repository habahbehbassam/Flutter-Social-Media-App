import 'package:flutter_social_media_app/core/errors/exceptions.dart';
import 'package:flutter_social_media_app/features/change_language/data/models/selected_language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SelectedLanguageLocalDataSource {
  Future<SelectedLanguageModel> getSelectedLanguage();

  Future<bool> cacheSelectedLanguage(
    SelectedLanguageModel selectedLanguageModel,
  );
}

const cachedSelectedLanguage = 'CACHED_SELECTED_LANGUAGE';

class SelectedLanguageLocalDataSourceImpl
    implements SelectedLanguageLocalDataSource {
  final SharedPreferences sharedPreferences;

  SelectedLanguageLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<SelectedLanguageModel> getSelectedLanguage() {
    final cachedLanguage = sharedPreferences.getString(cachedSelectedLanguage);
    if (cachedLanguage == null) throw CacheException();
    return Future.value(
      SelectedLanguageModel(
        selectedLanguage: cachedLanguage,
      ),
    );
  }

  @override
  Future<bool> cacheSelectedLanguage(
    SelectedLanguageModel selectedLanguageModel,
  ) {
    return Future.value(
      sharedPreferences.setString(
          cachedSelectedLanguage, selectedLanguageModel.selectedLanguage),
    );
  }
}

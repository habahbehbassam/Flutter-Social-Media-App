import 'package:dartz/dartz.dart';
import 'package:flutter_social_media_app/core/errors/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/selected_language_repository.dart';

class CacheSelectedLanguage extends UseCase<bool, Params> {
  final SelectedLanguageRepository selectedLanguageRepository;

  CacheSelectedLanguage({required this.selectedLanguageRepository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await selectedLanguageRepository.cacheSelectedLanguage(
      params.selectedLanguage,
    );
  }
}

class Params {
  final String selectedLanguage;

  Params(this.selectedLanguage);
}

import 'package:dartz/dartz.dart';
import 'package:flutter_social_media_app/core/errors/failures.dart';
import 'package:flutter_social_media_app/core/usecase/usecase.dart';
import 'package:flutter_social_media_app/features/change_language/data/models/selected_language_model.dart';
import 'package:flutter_social_media_app/features/change_language/domain/repositories/selected_language_repository.dart';

class GetSelectedLanguage extends UseCase<SelectedLanguageModel, NoParams> {
  final SelectedLanguageRepository selectedLanguageRepository;

  GetSelectedLanguage({required this.selectedLanguageRepository});

  @override
  Future<Either<Failure, SelectedLanguageModel>> call(NoParams params) async {
    return await selectedLanguageRepository.getSelectedLanguage();
  }
}

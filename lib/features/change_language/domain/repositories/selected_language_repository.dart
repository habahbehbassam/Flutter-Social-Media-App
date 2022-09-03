import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/selected_language_model.dart';

abstract class SelectedLanguageRepository {
  Future<Either<Failure, SelectedLanguageModel>> getSelectedLanguage();
  Future<Either<Failure, bool>> cacheSelectedLanguage(String selectedLanguage);
}

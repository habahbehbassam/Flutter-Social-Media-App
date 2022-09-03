import 'package:dartz/dartz.dart';
import 'package:flutter_social_media_app/core/errors/exceptions.dart';
import 'package:flutter_social_media_app/core/errors/failures.dart';
import 'package:flutter_social_media_app/features/change_language/data/datasources/selected_language_local_data_source.dart';
import 'package:flutter_social_media_app/features/change_language/data/models/selected_language_model.dart';
import 'package:flutter_social_media_app/features/change_language/domain/repositories/selected_language_repository.dart';

class SelectedLanguageRepositoryImpl implements SelectedLanguageRepository {
  final SelectedLanguageLocalDataSource selectedLanguageLocalDataSource;

  SelectedLanguageRepositoryImpl({
    required this.selectedLanguageLocalDataSource,
  });

  @override
  Future<Either<Failure, SelectedLanguageModel>> getSelectedLanguage() async {
    try {
      final localSelectedLanguage =
          await selectedLanguageLocalDataSource.getSelectedLanguage();
      return Right(localSelectedLanguage);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> cacheSelectedLanguage(String selectedLanguage) async {
    final isCached =  await selectedLanguageLocalDataSource.cacheSelectedLanguage(
      SelectedLanguageModel(selectedLanguage: selectedLanguage),
    );
    if(isCached){
      return Right(isCached);
    }else {
      return Left(CacheFailure());
    }
  }


}

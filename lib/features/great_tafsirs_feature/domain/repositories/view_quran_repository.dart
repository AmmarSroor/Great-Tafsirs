import 'package:dartz/dartz.dart';
import 'package:great_tafsirs/core/errors/failures.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/ayah_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/hizb_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/juzData.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/page_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/surah_data.dart';

abstract class ViewQuranRepository{
  Future<Either<Failure ,SurahData>> getSurahData(String name);
  Future<Either<Failure ,AyahData>> getAyahData(int number);
  Future<Either<Failure ,JuzData>> getJuzData(String name);
  Future<Either<Failure ,HizbData>> getHizbData(int number);
  Future<Either<Failure ,PageData>> getPageData(int number);
}
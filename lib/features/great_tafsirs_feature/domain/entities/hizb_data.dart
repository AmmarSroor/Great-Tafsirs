import 'package:equatable/equatable.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/page_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/surah_data.dart';

class HizbData extends Equatable{
  final int number;
  final String nameOfJuz;
  final List<SurahData> surahs;
  final List<PageData> pages;

  HizbData({
    required this.number,
    required this.nameOfJuz,
    required this.surahs,
    required this.pages,
  });

  @override
  List<Object?> get props => [number,nameOfJuz,surahs,pages];
}
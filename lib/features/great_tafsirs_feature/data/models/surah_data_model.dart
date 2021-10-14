import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/ayah_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/surah_data.dart';

class SurahDataModel extends SurahData {
  final int number;
  final String name;
  final List<AyahData> ayahs;

  SurahDataModel({
    required this.number,
    required this.name,
    required this.ayahs,
  }) :super(number: number,name: name,ayahs: ayahs);
}

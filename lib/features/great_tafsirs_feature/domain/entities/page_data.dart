import 'package:equatable/equatable.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/ayah_data.dart';

class PageData extends Equatable{
  final int number;
  final String nameOfSurah;
  final String nameOfJuz;
  final List<AyahData> ayahs;
  final int hizbNumber;

  PageData({
    required this.number,
    required this.nameOfSurah,
    required this.nameOfJuz,
    required this.ayahs,
    required this.hizbNumber,
  });

  @override
  List<Object?> get props => [number,nameOfSurah,nameOfJuz,ayahs,hizbNumber];
}

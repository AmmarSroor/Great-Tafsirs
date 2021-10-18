import 'package:equatable/equatable.dart';

import 'ayah_data.dart';

class SurahData extends Equatable{
  final int number;
  final String name;
  final List<AyahData> ayahs;

  SurahData({
    required this.number,
    required this.name,
    required this.ayahs,
  });

  @override
  List<Object?> get props => [];
}

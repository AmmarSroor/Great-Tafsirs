import 'package:equatable/equatable.dart';

class AyahData extends Equatable{
  final int number;
  final String text;
  final String juz;
  final int page;
  final int hizbQuarter;
  final bool sajda;

  AyahData({
    required this.number,
    required this.text,
    required this.juz,
    required this.page,
    required this.hizbQuarter,
    required this.sajda,
  });

  @override
  List<Object?> get props => [number,text,juz,page,hizbQuarter,sajda];
}

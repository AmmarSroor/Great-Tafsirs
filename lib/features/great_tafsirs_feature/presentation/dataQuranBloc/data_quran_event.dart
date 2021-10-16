part of 'data_quran_bloc.dart';

abstract class DataQuranEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAyahDataEvent extends DataQuranEvent{
  final int number;

  GetAyahDataEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class GetHizbDataEvent extends DataQuranEvent{
  final int number;

  GetHizbDataEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class GetJuzDataEvent extends DataQuranEvent{
  final String name;

  GetJuzDataEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class GetPageDataEvent extends DataQuranEvent{
  final int number;

  GetPageDataEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class GetSurahDataEvent extends DataQuranEvent{
  final String name;

  GetSurahDataEvent(this.name);

  @override
  List<Object?> get props => [name];
}


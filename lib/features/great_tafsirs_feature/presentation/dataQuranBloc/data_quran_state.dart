part of 'data_quran_bloc.dart';

abstract class DataQuranState extends Equatable {

  @override
  List<Object?> get props => [];
}

class DataQuranInitial extends DataQuranState {} // Empty

class Loading extends DataQuranState {}

class Loaded extends DataQuranState {
  AyahData ayahData;
  Loaded({required this.ayahData});

  @override
  List<Object?> get props => [ayahData];
}

class Error extends DataQuranState {
  final String message;
  Error({required this.message});

  @override
  List<Object?> get props => [message];
}

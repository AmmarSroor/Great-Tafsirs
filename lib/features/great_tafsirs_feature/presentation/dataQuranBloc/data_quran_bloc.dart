import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/ayah_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/usecases/getSurahData.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/usecases/get_ayah_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/usecases/get_hizb_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/usecases/get_juz_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/usecases/get_page_data.dart';

part 'data_quran_event.dart';
part 'data_quran_state.dart';


class DataQuranBloc extends Bloc<DataQuranEvent, DataQuranState> {
  final GetAyahData getAyahData;
  final GetHizbData getHizbData;
  final GetJuzData getJuzData;
  final GetPageData getPageData;
  final GetSurahData getSurahData;

  DataQuranBloc({
    required this.getAyahData,
    required this.getHizbData,
    required this.getJuzData,
    required this.getPageData,
    required this.getSurahData,
  }) : super(DataQuranInitial());

  @override
  Stream<DataQuranState> mapEventToState(DataQuranEvent event) async*{
    // ....
    // ...
    // ..
    // .
  }

}

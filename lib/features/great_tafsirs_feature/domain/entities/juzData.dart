import 'package:equatable/equatable.dart';

import 'hizb_data.dart';
import 'page_data.dart';

class JuzData extends Equatable{
  final int number;
  final String name;
  final List<PageData> pages;
  final List<HizbData> hizbData;

  JuzData({
    required this.number,
    required this.name,
    required this.pages,
    required this.hizbData,
  });

  @override
  List<Object?> get props => [number,name,pages,hizbData];
}

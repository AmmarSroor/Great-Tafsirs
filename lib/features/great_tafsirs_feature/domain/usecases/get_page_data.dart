import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:great_tafsirs/core/errors/failures.dart';
import 'package:great_tafsirs/core/usecases/usecase.dart';

import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/page_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/repositories/view_quran_repository.dart';

class GetPageData implements UseCase<PageData,Parameters> {
  final ViewQuranRepository repository;

  GetPageData(this.repository);

  @override
  Future<Either<Failure,PageData>> call(Parameters parameters) async{
    return await repository.getPageData(parameters.number);
  }

}

class Parameters extends Equatable{
  final int number;

  Parameters({required this.number});

  @override
  List<Object?> get props => [Parameters(number: number)];

}
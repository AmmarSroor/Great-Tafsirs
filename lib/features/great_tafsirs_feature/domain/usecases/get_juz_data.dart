import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:great_tafsirs/core/errors/failures.dart';
import 'package:great_tafsirs/core/usecases/usecase.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/juzData.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/repositories/view_quran_repository.dart';


class GetJuzData implements UseCase<JuzData,Parameters> {
  final ViewQuranRepository repository;

  GetJuzData(this.repository);

  @override
  Future<Either<Failure,JuzData>> call(Parameters parameters) async{
    return await repository.getJuzData(parameters.name);
  }

}

class Parameters extends Equatable{
  final String name;

  Parameters({required this.name});

  @override
  List<Object?> get props => [Parameters(name: name)];

}
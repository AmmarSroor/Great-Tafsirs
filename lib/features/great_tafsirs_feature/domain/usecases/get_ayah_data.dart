import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:great_tafsirs/core/errors/failures.dart';
import 'package:great_tafsirs/core/usecases/usecase.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/entities/ayah_data.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/domain/repositories/view_quran_repository.dart';

class GetAyahData implements UseCase<AyahData,Parameters> {
  final ViewQuranRepository repository;

  GetAyahData(this.repository);

  @override
  Future<Either<Failure,AyahData>> call(Parameters parameters) async{
    return await repository.getAyahData(parameters.number);
  }

}

class Parameters extends Equatable{
  final int number;

  Parameters({required this.number});

  @override
  List<Object?> get props => [Parameters(number: number)];

}
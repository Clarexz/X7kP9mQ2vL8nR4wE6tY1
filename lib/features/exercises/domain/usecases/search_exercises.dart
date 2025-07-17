import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class SearchExercises implements UseCase<List<Exercise>, SearchExercisesParams> {
  final ExerciseRepository repository;

  SearchExercises(this.repository);

  @override
  Future<Either<Failure, List<Exercise>>> call(SearchExercisesParams params) async {
    if (params.query.trim().isEmpty) {
      return Left(ValidationFailure('La consulta de búsqueda no puede estar vacía'));
    }
    return await repository.searchExercises(params.query);
  }
}

class SearchExercisesParams extends Equatable {
  final String query;

  const SearchExercisesParams({required this.query});

  @override
  List<Object> get props => [query];
}
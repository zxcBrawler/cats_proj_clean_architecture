import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/core/usecase/usecase.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';

class GetCatsIntelligenceUsecase implements UseCase<DataState<List<CatEntity>>, int> {
  final CatRepository _catRepository;

  GetCatsIntelligenceUsecase(this._catRepository);

  @override
  Future<DataState<List<CatEntity>>> call({int? params}) async {
    return await _catRepository.getCatsIntelligence(intelligence: params!);
  }

  
}
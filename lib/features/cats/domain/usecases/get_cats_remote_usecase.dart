import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/core/usecase/usecase.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';

class GetCatsRemoteUsecase implements UseCase<DataState<List<CatEntity>>, int> {
  final CatRepository _catRepository;

  GetCatsRemoteUsecase(this._catRepository);

  @override
  Future<DataState<List<CatEntity>>> call({int params = 5}) async {
    return await _catRepository.getCatsRemote(playfulness: params);
  }
}

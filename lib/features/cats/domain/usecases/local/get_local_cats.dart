import 'package:cats_ca/core/usecase/usecase.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';

class GetCatsLocalUsecase implements UseCase<List<CatEntity>, void> {
  final CatRepository _catRepository;

  GetCatsLocalUsecase(this._catRepository);

  @override
  Future<List<CatEntity>> call({void params}) {
    return _catRepository.getCatsLocal();
  }
}

import 'package:cats_ca/core/usecase/usecase.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';

class AddCatLocalUsecase implements UseCase<void, CatEntity> {
  final CatRepository _catRepository;

  AddCatLocalUsecase(this._catRepository);

  @override
  Future<void> call({CatEntity? params}) {
    return _catRepository.saveCat(params!);
  }
}

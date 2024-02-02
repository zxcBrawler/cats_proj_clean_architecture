import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/core/usecase/usecase.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';

import '../repository/cat_repository.dart';

class GetCatByNameUseCase implements UseCase<DataState<CatEntity>, String> {
  final CatRepository _catRepository;

  GetCatByNameUseCase(this._catRepository);

  @override
  Future<DataState<CatEntity>> call({String? params}) {
    return _catRepository.getOneCat(params!);
  }
}

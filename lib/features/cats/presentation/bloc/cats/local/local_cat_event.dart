import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LocalCatsEvent extends Equatable {
  final CatEntity? catEntity;

  const LocalCatsEvent({this.catEntity});

  @override
  List<Object> get props => [catEntity!];
}

class GetCatsLocal extends LocalCatsEvent {
  const GetCatsLocal();
}

class DeleteCat extends LocalCatsEvent {
  const DeleteCat(CatEntity catEntity) : super(catEntity: catEntity);
}

class AddCat extends LocalCatsEvent {
  const AddCat(CatEntity catEntity) : super(catEntity: catEntity);
}

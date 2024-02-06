import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LocalCatState extends Equatable {
  final List<CatEntity>? cats;

  const LocalCatState({this.cats});

  @override
  List<Object> get props => [cats!];
}

class LocalCatsLoading extends LocalCatState {
  const LocalCatsLoading();
}

class LocalCatsDone extends LocalCatState {
  const LocalCatsDone(List<CatEntity> cats) : super(cats: cats);
}

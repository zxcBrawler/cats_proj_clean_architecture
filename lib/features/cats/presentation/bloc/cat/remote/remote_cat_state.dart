import 'dart:math';

import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteCatState extends Equatable {
  final List<CatEntity>? cats;
  final DioException? error;

  const RemoteCatState({this.cats, this.error});

  @override
  List<Object> get props => [cats!, error!];
}

class RemoteCatsLoading extends RemoteCatState {
  const RemoteCatsLoading();
}

class RemoteCatsDone extends RemoteCatState {
  const RemoteCatsDone(List<CatEntity> cats) : super(cats: cats);
}

class RemoteCatsError extends RemoteCatState {
  const RemoteCatsError(DioException error) : super(error: error);
}

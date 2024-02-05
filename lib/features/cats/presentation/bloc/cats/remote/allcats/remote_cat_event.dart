abstract class RemoteCatsEvent {
  final int? param;
  const RemoteCatsEvent({this.param});

  List<Object> get props => [param!];
}

class GetCats extends RemoteCatsEvent {
  const GetCats();
}

class GetCatsGrooming extends RemoteCatsEvent {
  const GetCatsGrooming(int param) : super(param: param);
}

class GetCatsGeneralHealth extends RemoteCatsEvent {
  const GetCatsGeneralHealth(int param) : super(param: param);
}

class GetCatsShedding extends RemoteCatsEvent {
  const GetCatsShedding(int param) : super(param: param);
}

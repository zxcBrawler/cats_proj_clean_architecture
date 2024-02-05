abstract class RemoteCatsEvent {
  final int? param;
  const RemoteCatsEvent({this.param});

  @override
  List<Object> get props => [param!];
}

class GetCats extends RemoteCatsEvent {
  const GetCats();
}

class GetCatsFamilyFriendly extends RemoteCatsEvent {
  const GetCatsFamilyFriendly(int param) : super(param: param);
}

class GetCatsGeneralHealth extends RemoteCatsEvent {
  const GetCatsGeneralHealth(int param) : super(param: param);
}

class GetCatsIntelligence extends RemoteCatsEvent {
  const GetCatsIntelligence(int param) : super(param: param);
}

class GetCatsShedding extends RemoteCatsEvent {
  const GetCatsShedding(int param) : super(param: param);
}

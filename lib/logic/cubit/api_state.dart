
abstract class ApiState{}

class ApiStateLoading extends ApiState{}
class ApiStateSuccess<Data> extends ApiState{
  final Data response;

  ApiStateSuccess(this.response);
}
class ApiStateError<Error> extends ApiState{
  final Error response;

  ApiStateError(this.response);
}

abstract class GenericUseCase<Type, Params> {
  Future<Type?> call({Params? params});
}

abstract interface class Repository<T, ID> {
  Future<T> findOne(ID id);
  Future<List<T>> findAll();
}

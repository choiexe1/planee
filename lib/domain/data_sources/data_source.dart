abstract interface class DataSource<T, ID> {
  Future<void> create(T dto);
  Future<T> findOne(ID id);
  Future<List<T>> findAll();
}

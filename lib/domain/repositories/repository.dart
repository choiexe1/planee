abstract interface class Repository<T, ID, DTO> {
  Future<void> create(DTO dto);
  Future<T> findOne(ID id);
  Future<List<T>> findAll();
}

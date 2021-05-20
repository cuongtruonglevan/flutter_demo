part of data_access;

abstract class AbstractRepository {
  AbstractRepository();

  factory AbstractRepository.create() => _ConcreteRepository(_RequestService());

  factory AbstractRepository.mock(BuildContext context) => _MockRepository(context);

  Future<List<StockTicker>> getStockTickers();

  Future<List<String>> getInstructionStocks();

  Future<List<String>> getInstructionRisks();

  Future<List<String>> getInstructionSectors();
}

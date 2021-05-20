part of data_access;

class _ConcreteRepository extends AbstractRepository {
  final _RequestService _requestService;

  _ConcreteRepository(this._requestService);

  @override
  Future<List<StockTicker>> getStockTickers() async {
    final List jsonList =
        await _requestService.performGet('Put your path here');
    return jsonList.map((e) => StockTicker.fromJson(e)).toList();
  }

  @override
  Future<List<String>> getInstructionRisks() {
    // TODO: implement getInstructionRisk
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getInstructionSectors() {
    // TODO: implement getInstructionSector
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getInstructionStocks() {
    // TODO: implement getInstructionSymbol
    throw UnimplementedError();
  }
}

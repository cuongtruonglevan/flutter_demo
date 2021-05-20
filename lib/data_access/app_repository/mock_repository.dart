part of data_access;

class _MockRepository extends AbstractRepository {
  final BuildContext context;

  _MockRepository(this.context);

  @override
  Future<List<StockTicker>> getStockTickers() async {
    await Future.delayed(Duration(milliseconds: 1000));
    String rawJson =
        await DefaultAssetBundle.of(context).loadString('assets/sample.json');
    final _stockTickers = List<StockTicker>.from(
        json.decode(rawJson).map((e) => StockTicker.fromJson(e)));
    return _stockTickers;
  }

  @override
  Future<List<String>> getInstructionRisks() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return ['High', 'Medium', 'Low'];
  }

  @override
  Future<List<String>> getInstructionSectors() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return [
      'Technology',
      'Consumer Services',
      'Consumer Non-Durables',
      'Finance',
      'Health Care',
      'Energy'
    ];
  }

  @override
  Future<List<String>> getInstructionStocks() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return ['NYSE', 'NASDAQ'];
  }
}

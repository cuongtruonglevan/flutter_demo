part of model;

@JsonSerializable()
class StockTicker {
  @JsonKey(required: true, disallowNullValue: true)
  final int id;
  @JsonKey(includeIfNull: true)
  final String stock;
  @JsonKey(includeIfNull: true)
  final String symbol;
  @JsonKey(includeIfNull: true)
  final String name;
  @JsonKey(includeIfNull: true)
  final String lastSale;
  @JsonKey(includeIfNull: true)
  final String marketCap;
  @JsonKey(includeIfNull: true)
  final String country;
  @JsonKey(includeIfNull: true)
  final int ipoYear;
  @JsonKey(includeIfNull: true)
  final String sector;
  @JsonKey(includeIfNull: true)
  final String industry;

  // @JsonKey(includeIfNull: true)
  // final String peQuote;
  // @JsonKey(includeIfNull: true)
  // final String ebitda;
  // @JsonKey(includeIfNull: true)
  // final String netIncome;
  // @JsonKey(includeIfNull: true)
  // final String revenue;
  // @JsonKey(includeIfNull: true)
  // final String eps;
  // @JsonKey(includeIfNull: true)
  // final String epsDiluted;
  // @JsonKey(includeIfNull: true)
  // final String totalAssets;
  // @JsonKey(includeIfNull: true)
  // final String totalLiabilities;
  // @JsonKey(includeIfNull: true)
  // final String cashAndShortenInvestments;
  // @JsonKey(includeIfNull: true)
  // final String freeCashFlow;
  // @JsonKey(includeIfNull: true)
  // final String growthEBITDA;
  // @JsonKey(includeIfNull: true)
  // final String growthNetIncome;
  // @JsonKey(includeIfNull: true)
  // final String growthEPS;
  // @JsonKey(includeIfNull: true)
  // final String derivedNetIncome;
  // @JsonKey(includeIfNull: true)
  // final String derivedDebtRatio;

  StockTicker(this.id, this.stock, this.symbol, this.name, this.lastSale,
      this.marketCap, this.country, this.ipoYear, this.sector, this.industry);

  factory StockTicker.fromJson(Map<String, dynamic> json) =>
      _$StockTickerFromJson(json);

  Map<String, dynamic> toJson() => _$StockTickerToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstructionTag _$InstructionTagFromJson(Map<String, dynamic> json) {
  return InstructionTag(
    json['name'] as String,
    json['isSelected'] as bool? ?? false,
  );
}

Map<String, dynamic> _$InstructionTagToJson(InstructionTag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isSelected': instance.isSelected,
    };

StockTicker _$StockTickerFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id'], disallowNullValues: const ['id']);
  return StockTicker(
    json['id'] as int,
    json['stock'] as String,
    json['symbol'] as String,
    json['name'] as String,
    json['lastSale'] as String,
    json['marketCap'] as String,
    json['country'] as String,
    json['ipoYear'] as int,
    json['sector'] as String,
    json['industry'] as String,
  );
}

Map<String, dynamic> _$StockTickerToJson(StockTicker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stock': instance.stock,
      'symbol': instance.symbol,
      'name': instance.name,
      'lastSale': instance.lastSale,
      'marketCap': instance.marketCap,
      'country': instance.country,
      'ipoYear': instance.ipoYear,
      'sector': instance.sector,
      'industry': instance.industry,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id', 'emailAddress'],
      disallowNullValues: const ['id', 'emailAddress']);
  return User(
    json['id'] as String,
    json['emailAddress'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    (json['instructionMap'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'emailAddress': instance.emailAddress,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'instructionMap': instance.instructionMap,
    };

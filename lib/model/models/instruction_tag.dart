part of model;

@JsonSerializable()
class InstructionTag {
  @JsonKey(includeIfNull: true)
  final String name;
  @JsonKey(includeIfNull: true, defaultValue: false)
  bool isSelected;

  InstructionTag(this.name, this.isSelected);

  factory InstructionTag.fromJson(Map<String, dynamic> json) =>
      _$InstructionTagFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionTagToJson(this);
}

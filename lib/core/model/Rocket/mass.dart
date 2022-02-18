import 'package:json_annotation/json_annotation.dart';

part 'mass.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Mass{
  int? kg;

  Mass({this.kg});

  factory Mass.fromJson(Map<String, dynamic> json) =>
      _$MassFromJson(json);

  Map<String, dynamic> toJson() => _$MassToJson(this);
}



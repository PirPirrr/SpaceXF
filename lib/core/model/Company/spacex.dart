import 'package:flutterspacex/core/model/Company/headquarters.dart';
import 'package:flutterspacex/core/model/Company/links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spacex.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Spacex{
  String? name;
  String? founder;
  int? founded;
  int? employees;
  int? valuation;
  String? summary;
  Headquarters? headquarters;
  Links? links;

  Spacex({this.name,this.founder,this.founded,this.employees,this.valuation,this.summary,this.headquarters,this.links});

  factory Spacex.fromJson(Map<String, dynamic> json) =>
      _$SpacexFromJson(json);

  Map<String, dynamic> toJson() => _$SpacexToJson(this);
}
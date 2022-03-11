import 'package:json_annotation/json_annotation.dart';

part 'spacex.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Spacex{
  String? name;
  String? founder;
  int? founded;
  int? employees;
  String? ceo;
  int? valuation;
  String? summary;

  Spacex({this.name,this.founder,this.founded,this.employees,this.ceo,this.valuation,this.summary});
}
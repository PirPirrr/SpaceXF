import 'package:json_annotation/json_annotation.dart';

part 'headquarters.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Headquarters{
  String? address;
  String? city;
  String? state;

  Headquarters({this.address,this.city,this.state});
}
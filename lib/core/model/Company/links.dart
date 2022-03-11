import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Links{
  String? website;
  String? flickr;
  String? twitter;
  String? elon_twitter;

  Links({this.website,this.flickr,this.twitter,this.elon_twitter});
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landpad _$LandpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Landpad',
      json,
      ($checkedConvert) {
        final val = Landpad(
          name: $checkedConvert('name', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LandpadToJson(Landpad instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

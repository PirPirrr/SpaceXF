// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launchpad _$LaunchpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launchpad',
      json,
      ($checkedConvert) {
        final val = Launchpad(
          name: $checkedConvert('name', (v) => v as String?),
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
          id: $checkedConvert('id', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LaunchpadToJson(Launchpad instance) => <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'id': instance.id,
    };

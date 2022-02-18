// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Core _$CoreFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Core',
      json,
      ($checkedConvert) {
        final val = Core(
          flight: $checkedConvert('flight', (v) => v as int?),
          landingAttempt: $checkedConvert('landingAttempt', (v) => v as bool?),
          landingSuccess: $checkedConvert('landingSuccess', (v) => v as bool?),
          landpad: $checkedConvert('landpad', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CoreToJson(Core instance) => <String, dynamic>{
      'flight': instance.flight,
      'landingAttempt': instance.landingAttempt,
      'landingSuccess': instance.landingSuccess,
      'landpad': instance.landpad,
    };

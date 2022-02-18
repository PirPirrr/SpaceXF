// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failures _$FailuresFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Failures',
      json,
      ($checkedConvert) {
        final val = Failures(
          reason: $checkedConvert('reason', (v) => v as String?),
          time: $checkedConvert('time', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$FailuresToJson(Failures instance) => <String, dynamic>{
      'time': instance.time,
      'reason': instance.reason,
    };

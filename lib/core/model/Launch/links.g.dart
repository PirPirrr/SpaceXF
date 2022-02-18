// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Links',
      json,
      ($checkedConvert) {
        final val = Links(
          patch: $checkedConvert(
              'patch',
              (v) =>
                  v == null ? null : Patch.fromJson(v as Map<String, dynamic>)),
          webcast: $checkedConvert('webcast', (v) => v as String?),
          youtubeId: $checkedConvert('youtubeId', (v) => v as String?),
          wikipedia: $checkedConvert('wikipedia', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch?.toJson(),
      'webcast': instance.webcast,
      'youtubeId': instance.youtubeId,
      'wikipedia': instance.wikipedia,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_entities;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      department: json['department'] as String,
      hourVolunteered: (json['hourVolunteered'] as num).toDouble(),
      profileImageUrl: json['profileImageUrl'] as String?,
      volunteerActivities: json['volunteerActivities'] as int?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'department': instance.department,
      'hourVolunteered': instance.hourVolunteered,
      'profileImageUrl': instance.profileImageUrl,
      'volunteerActivities': instance.volunteerActivities,
    };

Map<String, dynamic> _$GetUserInfoRequestToJson(GetUserInfoRequest instance) =>
    <String, dynamic>{
      'anyMap': instance.anyMap,
      'checked': instance.checked,
      'constructor': instance.constructor,
      'createFactory': instance.createFactory,
      'createFieldMap': instance.createFieldMap,
      'createToJson': instance.createToJson,
      'disallowUnrecognizedKeys': instance.disallowUnrecognizedKeys,
      'explicitToJson': instance.explicitToJson,
      'fieldRename': _$FieldRenameEnumMap[instance.fieldRename],
      'genericArgumentFactories': instance.genericArgumentFactories,
      'ignoreUnannotated': instance.ignoreUnannotated,
      'includeIfNull': instance.includeIfNull,
      'id': instance.id,
    };

const _$FieldRenameEnumMap = {
  FieldRename.none: 'none',
  FieldRename.kebab: 'kebab',
  FieldRename.snake: 'snake',
  FieldRename.pascal: 'pascal',
  FieldRename.screamingSnake: 'screamingSnake',
};

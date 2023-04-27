part of user_entities;

@JsonSerializable(createFactory: false)
class GetUserInfoRequest extends JsonSerializable {
  final int id;

  const GetUserInfoRequest({
    required this.id,
  });

  @override
  Map<String, dynamic> toJson() => _$GetUserInfoRequestToJson(this);
}

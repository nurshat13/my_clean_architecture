import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

List<UserModel> userModelListFromString(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelListToString(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel({
    required int id,
    required String? firstName,
    required String? lastName,
    required String? thirdName,
    required String? phone,
    required DateTime? lastLogin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  String get fullname {
    String fullname = '';
    if (lastName != null && lastName!.isNotEmpty) fullname += '$lastName ';
    if (firstName != null && firstName!.isNotEmpty) fullname += firstName!;
    if (thirdName != null && thirdName!.isNotEmpty) fullname += ' $thirdName';
    return fullname;
  }

  String? getInitials() {
    String initials = '';
    if (firstName != null && firstName!.isNotEmpty) {
      initials += firstName!.toUpperCase().split('')[0];
    }

    if (lastName != null && lastName!.isNotEmpty) {
      initials += lastName!.toUpperCase().split('')[0];
    }

    return initials.isEmpty ? null : initials;
  }
}

// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    int? id,
    String? slug,
    String? url,
    String? title,
    String? content,
    String? image,
    String? thumbnail,
    String? status,
    String? category,
    String? publishedAt,
    String? updatedAt,
    int? userId,
  }) = _PostModel;

  static List<PostModel> fromList(List? list) {
    if (list == null) return [];
    return list.map((e) => PostModel.fromJson(e)).toList();
  }

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}

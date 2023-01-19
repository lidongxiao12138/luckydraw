import 'package:luckydraw/generated/json/base/json_field.dart';
import 'package:luckydraw/generated/json/take_award_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TakeAwardEntity {

	int? code;
	String? message;
	TakeAwardData? data;
  
  TakeAwardEntity();

  factory TakeAwardEntity.fromJson(Map<String, dynamic> json) => $TakeAwardEntityFromJson(json);

  Map<String, dynamic> toJson() => $TakeAwardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TakeAwardData {

	@JSONField(name: "Result")
	TakeAwardDataResult? result;
  
  TakeAwardData();

  factory TakeAwardData.fromJson(Map<String, dynamic> json) => $TakeAwardDataFromJson(json);

  Map<String, dynamic> toJson() => $TakeAwardDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TakeAwardDataResult {

	String? id;
	String? createBy;
	String? createTime;
	String? updateBy;
	dynamic updateTime;
	String? sysOrgCode;
	String? userNo;
	String? userName;
	String? plant;
	String? level;
	int? howmuch;
	String? reverse1;
	String? reverse2;
	String? reverse3;
	String? reverse4;
	String? reverse5;
  
  TakeAwardDataResult();

  factory TakeAwardDataResult.fromJson(Map<String, dynamic> json) => $TakeAwardDataResultFromJson(json);

  Map<String, dynamic> toJson() => $TakeAwardDataResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
import 'package:luckydraw/generated/json/base/json_field.dart';
import 'package:luckydraw/generated/json/award_records_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AwardRecordsEntity {

	int? code;
	String? message;
	AwardRecordsData? data;
  
  AwardRecordsEntity();

  factory AwardRecordsEntity.fromJson(Map<String, dynamic> json) => $AwardRecordsEntityFromJson(json);

  Map<String, dynamic> toJson() => $AwardRecordsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AwardRecordsData {

	@JSONField(name: "Result")
	List<AwardRecordsDataResult>? result;
  
  AwardRecordsData();

  factory AwardRecordsData.fromJson(Map<String, dynamic> json) => $AwardRecordsDataFromJson(json);

  Map<String, dynamic> toJson() => $AwardRecordsDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AwardRecordsDataResult {

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
  
  AwardRecordsDataResult();

  factory AwardRecordsDataResult.fromJson(Map<String, dynamic> json) => $AwardRecordsDataResultFromJson(json);

  Map<String, dynamic> toJson() => $AwardRecordsDataResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
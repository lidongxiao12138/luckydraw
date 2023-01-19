import 'package:luckydraw/generated/json/base/json_field.dart';
import 'package:luckydraw/generated/json/user_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserInfoEntity {

	int? code;
	String? message;
	UserInfoData? data;
  
  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoData {

	@JSONField(name: "User")
	UserInfoDataUser? user;
  
  UserInfoData();

  factory UserInfoData.fromJson(Map<String, dynamic> json) => $UserInfoDataFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoDataUser {

	String? pernr;
	String? cpf01;
	String? cpf02;
	String? cpf28;
	String? werks;
	String? orgeh;
	String? cpf29;
	String? oStext;
	String? sStext;
	String? cpfbu;
	dynamic cpf70;
	String? cpf06;
	String? cpf11;
	String? cpf14;
	String? cpf37;
	String? taCpf41;
	dynamic cpf35;
	String? cpf36;
	String? cpf03;
	dynamic cpfud13;
	String? yyzx;
	String? plans;
	String? zhr000101;
	String? chObjid;
	String? fnObjid;
	String? fnStext;
	String? taCpf36;
	String? taCpf37;
	dynamic cpfdate;
	String? abkrs;
	String? cpf08;
	String? pcdWerks;
	String? clientid;
	String? taCpf01;
	String? cpfud04;
	dynamic insertTime;
	String? cpfud02;
	String? cpfud07;
	dynamic cpf04;
	String? cpf07;
	String? cpfud06;
	String? cpf40;
	dynamic taCpf51;
	String? cpf09;
	String? persk;
	String? cpf116;
	dynamic a1Date;
	String? persg;
	dynamic tbDate;
  
  UserInfoDataUser();

  factory UserInfoDataUser.fromJson(Map<String, dynamic> json) => $UserInfoDataUserFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
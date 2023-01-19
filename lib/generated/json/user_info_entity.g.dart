import 'package:luckydraw/generated/json/base/json_convert_content.dart';
import 'package:luckydraw/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
	final UserInfoEntity userInfoEntity = UserInfoEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		userInfoEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		userInfoEntity.message = message;
	}
	final UserInfoData? data = jsonConvert.convert<UserInfoData>(json['data']);
	if (data != null) {
		userInfoEntity.data = data;
	}
	return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

UserInfoData $UserInfoDataFromJson(Map<String, dynamic> json) {
	final UserInfoData userInfoData = UserInfoData();
	final UserInfoDataUser? user = jsonConvert.convert<UserInfoDataUser>(json['User']);
	if (user != null) {
		userInfoData.user = user;
	}
	return userInfoData;
}

Map<String, dynamic> $UserInfoDataToJson(UserInfoData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['User'] = entity.user?.toJson();
	return data;
}

UserInfoDataUser $UserInfoDataUserFromJson(Map<String, dynamic> json) {
	final UserInfoDataUser userInfoDataUser = UserInfoDataUser();
	final String? pernr = jsonConvert.convert<String>(json['pernr']);
	if (pernr != null) {
		userInfoDataUser.pernr = pernr;
	}
	final String? cpf01 = jsonConvert.convert<String>(json['cpf01']);
	if (cpf01 != null) {
		userInfoDataUser.cpf01 = cpf01;
	}
	final String? cpf02 = jsonConvert.convert<String>(json['cpf02']);
	if (cpf02 != null) {
		userInfoDataUser.cpf02 = cpf02;
	}
	final String? cpf28 = jsonConvert.convert<String>(json['cpf28']);
	if (cpf28 != null) {
		userInfoDataUser.cpf28 = cpf28;
	}
	final String? werks = jsonConvert.convert<String>(json['werks']);
	if (werks != null) {
		userInfoDataUser.werks = werks;
	}
	final String? orgeh = jsonConvert.convert<String>(json['orgeh']);
	if (orgeh != null) {
		userInfoDataUser.orgeh = orgeh;
	}
	final String? cpf29 = jsonConvert.convert<String>(json['cpf29']);
	if (cpf29 != null) {
		userInfoDataUser.cpf29 = cpf29;
	}
	final String? oStext = jsonConvert.convert<String>(json['oStext']);
	if (oStext != null) {
		userInfoDataUser.oStext = oStext;
	}
	final String? sStext = jsonConvert.convert<String>(json['sStext']);
	if (sStext != null) {
		userInfoDataUser.sStext = sStext;
	}
	final String? cpfbu = jsonConvert.convert<String>(json['cpfbu']);
	if (cpfbu != null) {
		userInfoDataUser.cpfbu = cpfbu;
	}
	final dynamic? cpf70 = jsonConvert.convert<dynamic>(json['cpf70']);
	if (cpf70 != null) {
		userInfoDataUser.cpf70 = cpf70;
	}
	final String? cpf06 = jsonConvert.convert<String>(json['cpf06']);
	if (cpf06 != null) {
		userInfoDataUser.cpf06 = cpf06;
	}
	final String? cpf11 = jsonConvert.convert<String>(json['cpf11']);
	if (cpf11 != null) {
		userInfoDataUser.cpf11 = cpf11;
	}
	final String? cpf14 = jsonConvert.convert<String>(json['cpf14']);
	if (cpf14 != null) {
		userInfoDataUser.cpf14 = cpf14;
	}
	final String? cpf37 = jsonConvert.convert<String>(json['cpf37']);
	if (cpf37 != null) {
		userInfoDataUser.cpf37 = cpf37;
	}
	final String? taCpf41 = jsonConvert.convert<String>(json['taCpf41']);
	if (taCpf41 != null) {
		userInfoDataUser.taCpf41 = taCpf41;
	}
	final dynamic? cpf35 = jsonConvert.convert<dynamic>(json['cpf35']);
	if (cpf35 != null) {
		userInfoDataUser.cpf35 = cpf35;
	}
	final String? cpf36 = jsonConvert.convert<String>(json['cpf36']);
	if (cpf36 != null) {
		userInfoDataUser.cpf36 = cpf36;
	}
	final String? cpf03 = jsonConvert.convert<String>(json['cpf03']);
	if (cpf03 != null) {
		userInfoDataUser.cpf03 = cpf03;
	}
	final dynamic? cpfud13 = jsonConvert.convert<dynamic>(json['cpfud13']);
	if (cpfud13 != null) {
		userInfoDataUser.cpfud13 = cpfud13;
	}
	final String? yyzx = jsonConvert.convert<String>(json['yyzx']);
	if (yyzx != null) {
		userInfoDataUser.yyzx = yyzx;
	}
	final String? plans = jsonConvert.convert<String>(json['plans']);
	if (plans != null) {
		userInfoDataUser.plans = plans;
	}
	final String? zhr000101 = jsonConvert.convert<String>(json['zhr000101']);
	if (zhr000101 != null) {
		userInfoDataUser.zhr000101 = zhr000101;
	}
	final String? chObjid = jsonConvert.convert<String>(json['chObjid']);
	if (chObjid != null) {
		userInfoDataUser.chObjid = chObjid;
	}
	final String? fnObjid = jsonConvert.convert<String>(json['fnObjid']);
	if (fnObjid != null) {
		userInfoDataUser.fnObjid = fnObjid;
	}
	final String? fnStext = jsonConvert.convert<String>(json['fnStext']);
	if (fnStext != null) {
		userInfoDataUser.fnStext = fnStext;
	}
	final String? taCpf36 = jsonConvert.convert<String>(json['taCpf36']);
	if (taCpf36 != null) {
		userInfoDataUser.taCpf36 = taCpf36;
	}
	final String? taCpf37 = jsonConvert.convert<String>(json['taCpf37']);
	if (taCpf37 != null) {
		userInfoDataUser.taCpf37 = taCpf37;
	}
	final dynamic? cpfdate = jsonConvert.convert<dynamic>(json['cpfdate']);
	if (cpfdate != null) {
		userInfoDataUser.cpfdate = cpfdate;
	}
	final String? abkrs = jsonConvert.convert<String>(json['abkrs']);
	if (abkrs != null) {
		userInfoDataUser.abkrs = abkrs;
	}
	final String? cpf08 = jsonConvert.convert<String>(json['cpf08']);
	if (cpf08 != null) {
		userInfoDataUser.cpf08 = cpf08;
	}
	final String? pcdWerks = jsonConvert.convert<String>(json['pcdWerks']);
	if (pcdWerks != null) {
		userInfoDataUser.pcdWerks = pcdWerks;
	}
	final String? clientid = jsonConvert.convert<String>(json['clientid']);
	if (clientid != null) {
		userInfoDataUser.clientid = clientid;
	}
	final String? taCpf01 = jsonConvert.convert<String>(json['taCpf01']);
	if (taCpf01 != null) {
		userInfoDataUser.taCpf01 = taCpf01;
	}
	final String? cpfud04 = jsonConvert.convert<String>(json['cpfud04']);
	if (cpfud04 != null) {
		userInfoDataUser.cpfud04 = cpfud04;
	}
	final dynamic? insertTime = jsonConvert.convert<dynamic>(json['insertTime']);
	if (insertTime != null) {
		userInfoDataUser.insertTime = insertTime;
	}
	final String? cpfud02 = jsonConvert.convert<String>(json['cpfud02']);
	if (cpfud02 != null) {
		userInfoDataUser.cpfud02 = cpfud02;
	}
	final String? cpfud07 = jsonConvert.convert<String>(json['cpfud07']);
	if (cpfud07 != null) {
		userInfoDataUser.cpfud07 = cpfud07;
	}
	final dynamic? cpf04 = jsonConvert.convert<dynamic>(json['cpf04']);
	if (cpf04 != null) {
		userInfoDataUser.cpf04 = cpf04;
	}
	final String? cpf07 = jsonConvert.convert<String>(json['cpf07']);
	if (cpf07 != null) {
		userInfoDataUser.cpf07 = cpf07;
	}
	final String? cpfud06 = jsonConvert.convert<String>(json['cpfud06']);
	if (cpfud06 != null) {
		userInfoDataUser.cpfud06 = cpfud06;
	}
	final String? cpf40 = jsonConvert.convert<String>(json['cpf40']);
	if (cpf40 != null) {
		userInfoDataUser.cpf40 = cpf40;
	}
	final dynamic? taCpf51 = jsonConvert.convert<dynamic>(json['taCpf51']);
	if (taCpf51 != null) {
		userInfoDataUser.taCpf51 = taCpf51;
	}
	final String? cpf09 = jsonConvert.convert<String>(json['cpf09']);
	if (cpf09 != null) {
		userInfoDataUser.cpf09 = cpf09;
	}
	final String? persk = jsonConvert.convert<String>(json['persk']);
	if (persk != null) {
		userInfoDataUser.persk = persk;
	}
	final String? cpf116 = jsonConvert.convert<String>(json['cpf116']);
	if (cpf116 != null) {
		userInfoDataUser.cpf116 = cpf116;
	}
	final dynamic? a1Date = jsonConvert.convert<dynamic>(json['a1Date']);
	if (a1Date != null) {
		userInfoDataUser.a1Date = a1Date;
	}
	final String? persg = jsonConvert.convert<String>(json['persg']);
	if (persg != null) {
		userInfoDataUser.persg = persg;
	}
	final dynamic? tbDate = jsonConvert.convert<dynamic>(json['tbDate']);
	if (tbDate != null) {
		userInfoDataUser.tbDate = tbDate;
	}
	return userInfoDataUser;
}

Map<String, dynamic> $UserInfoDataUserToJson(UserInfoDataUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['pernr'] = entity.pernr;
	data['cpf01'] = entity.cpf01;
	data['cpf02'] = entity.cpf02;
	data['cpf28'] = entity.cpf28;
	data['werks'] = entity.werks;
	data['orgeh'] = entity.orgeh;
	data['cpf29'] = entity.cpf29;
	data['oStext'] = entity.oStext;
	data['sStext'] = entity.sStext;
	data['cpfbu'] = entity.cpfbu;
	data['cpf70'] = entity.cpf70;
	data['cpf06'] = entity.cpf06;
	data['cpf11'] = entity.cpf11;
	data['cpf14'] = entity.cpf14;
	data['cpf37'] = entity.cpf37;
	data['taCpf41'] = entity.taCpf41;
	data['cpf35'] = entity.cpf35;
	data['cpf36'] = entity.cpf36;
	data['cpf03'] = entity.cpf03;
	data['cpfud13'] = entity.cpfud13;
	data['yyzx'] = entity.yyzx;
	data['plans'] = entity.plans;
	data['zhr000101'] = entity.zhr000101;
	data['chObjid'] = entity.chObjid;
	data['fnObjid'] = entity.fnObjid;
	data['fnStext'] = entity.fnStext;
	data['taCpf36'] = entity.taCpf36;
	data['taCpf37'] = entity.taCpf37;
	data['cpfdate'] = entity.cpfdate;
	data['abkrs'] = entity.abkrs;
	data['cpf08'] = entity.cpf08;
	data['pcdWerks'] = entity.pcdWerks;
	data['clientid'] = entity.clientid;
	data['taCpf01'] = entity.taCpf01;
	data['cpfud04'] = entity.cpfud04;
	data['insertTime'] = entity.insertTime;
	data['cpfud02'] = entity.cpfud02;
	data['cpfud07'] = entity.cpfud07;
	data['cpf04'] = entity.cpf04;
	data['cpf07'] = entity.cpf07;
	data['cpfud06'] = entity.cpfud06;
	data['cpf40'] = entity.cpf40;
	data['taCpf51'] = entity.taCpf51;
	data['cpf09'] = entity.cpf09;
	data['persk'] = entity.persk;
	data['cpf116'] = entity.cpf116;
	data['a1Date'] = entity.a1Date;
	data['persg'] = entity.persg;
	data['tbDate'] = entity.tbDate;
	return data;
}
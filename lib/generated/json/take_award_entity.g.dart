import 'package:luckydraw/generated/json/base/json_convert_content.dart';
import 'package:luckydraw/take_award_entity.dart';

TakeAwardEntity $TakeAwardEntityFromJson(Map<String, dynamic> json) {
	final TakeAwardEntity takeAwardEntity = TakeAwardEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		takeAwardEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		takeAwardEntity.message = message;
	}
	final TakeAwardData? data = jsonConvert.convert<TakeAwardData>(json['data']);
	if (data != null) {
		takeAwardEntity.data = data;
	}
	return takeAwardEntity;
}

Map<String, dynamic> $TakeAwardEntityToJson(TakeAwardEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

TakeAwardData $TakeAwardDataFromJson(Map<String, dynamic> json) {
	final TakeAwardData takeAwardData = TakeAwardData();
	final TakeAwardDataResult? result = jsonConvert.convert<TakeAwardDataResult>(json['Result']);
	if (result != null) {
		takeAwardData.result = result;
	}
	return takeAwardData;
}

Map<String, dynamic> $TakeAwardDataToJson(TakeAwardData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['Result'] = entity.result?.toJson();
	return data;
}

TakeAwardDataResult $TakeAwardDataResultFromJson(Map<String, dynamic> json) {
	final TakeAwardDataResult takeAwardDataResult = TakeAwardDataResult();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		takeAwardDataResult.id = id;
	}
	final String? createBy = jsonConvert.convert<String>(json['createBy']);
	if (createBy != null) {
		takeAwardDataResult.createBy = createBy;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		takeAwardDataResult.createTime = createTime;
	}
	final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
	if (updateBy != null) {
		takeAwardDataResult.updateBy = updateBy;
	}
	final dynamic? updateTime = jsonConvert.convert<dynamic>(json['updateTime']);
	if (updateTime != null) {
		takeAwardDataResult.updateTime = updateTime;
	}
	final String? sysOrgCode = jsonConvert.convert<String>(json['sysOrgCode']);
	if (sysOrgCode != null) {
		takeAwardDataResult.sysOrgCode = sysOrgCode;
	}
	final String? userNo = jsonConvert.convert<String>(json['userNo']);
	if (userNo != null) {
		takeAwardDataResult.userNo = userNo;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		takeAwardDataResult.userName = userName;
	}
	final String? plant = jsonConvert.convert<String>(json['plant']);
	if (plant != null) {
		takeAwardDataResult.plant = plant;
	}
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		takeAwardDataResult.level = level;
	}
	final int? howmuch = jsonConvert.convert<int>(json['howmuch']);
	if (howmuch != null) {
		takeAwardDataResult.howmuch = howmuch;
	}
	final String? reverse1 = jsonConvert.convert<String>(json['reverse1']);
	if (reverse1 != null) {
		takeAwardDataResult.reverse1 = reverse1;
	}
	final String? reverse2 = jsonConvert.convert<String>(json['reverse2']);
	if (reverse2 != null) {
		takeAwardDataResult.reverse2 = reverse2;
	}
	final String? reverse3 = jsonConvert.convert<String>(json['reverse3']);
	if (reverse3 != null) {
		takeAwardDataResult.reverse3 = reverse3;
	}
	final String? reverse4 = jsonConvert.convert<String>(json['reverse4']);
	if (reverse4 != null) {
		takeAwardDataResult.reverse4 = reverse4;
	}
	final String? reverse5 = jsonConvert.convert<String>(json['reverse5']);
	if (reverse5 != null) {
		takeAwardDataResult.reverse5 = reverse5;
	}
	return takeAwardDataResult;
}

Map<String, dynamic> $TakeAwardDataResultToJson(TakeAwardDataResult entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['createBy'] = entity.createBy;
	data['createTime'] = entity.createTime;
	data['updateBy'] = entity.updateBy;
	data['updateTime'] = entity.updateTime;
	data['sysOrgCode'] = entity.sysOrgCode;
	data['userNo'] = entity.userNo;
	data['userName'] = entity.userName;
	data['plant'] = entity.plant;
	data['level'] = entity.level;
	data['howmuch'] = entity.howmuch;
	data['reverse1'] = entity.reverse1;
	data['reverse2'] = entity.reverse2;
	data['reverse3'] = entity.reverse3;
	data['reverse4'] = entity.reverse4;
	data['reverse5'] = entity.reverse5;
	return data;
}
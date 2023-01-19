import 'package:luckydraw/generated/json/base/json_convert_content.dart';
import 'package:luckydraw/award_records_entity.dart';

AwardRecordsEntity $AwardRecordsEntityFromJson(Map<String, dynamic> json) {
	final AwardRecordsEntity awardRecordsEntity = AwardRecordsEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		awardRecordsEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		awardRecordsEntity.message = message;
	}
	final AwardRecordsData? data = jsonConvert.convert<AwardRecordsData>(json['data']);
	if (data != null) {
		awardRecordsEntity.data = data;
	}
	return awardRecordsEntity;
}

Map<String, dynamic> $AwardRecordsEntityToJson(AwardRecordsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AwardRecordsData $AwardRecordsDataFromJson(Map<String, dynamic> json) {
	final AwardRecordsData awardRecordsData = AwardRecordsData();
	final List<AwardRecordsDataResult>? result = jsonConvert.convertListNotNull<AwardRecordsDataResult>(json['Result']);
	if (result != null) {
		awardRecordsData.result = result;
	}
	return awardRecordsData;
}

Map<String, dynamic> $AwardRecordsDataToJson(AwardRecordsData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['Result'] =  entity.result?.map((v) => v.toJson()).toList();
	return data;
}

AwardRecordsDataResult $AwardRecordsDataResultFromJson(Map<String, dynamic> json) {
	final AwardRecordsDataResult awardRecordsDataResult = AwardRecordsDataResult();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		awardRecordsDataResult.id = id;
	}
	final String? createBy = jsonConvert.convert<String>(json['createBy']);
	if (createBy != null) {
		awardRecordsDataResult.createBy = createBy;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		awardRecordsDataResult.createTime = createTime;
	}
	final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
	if (updateBy != null) {
		awardRecordsDataResult.updateBy = updateBy;
	}
	final dynamic? updateTime = jsonConvert.convert<dynamic>(json['updateTime']);
	if (updateTime != null) {
		awardRecordsDataResult.updateTime = updateTime;
	}
	final String? sysOrgCode = jsonConvert.convert<String>(json['sysOrgCode']);
	if (sysOrgCode != null) {
		awardRecordsDataResult.sysOrgCode = sysOrgCode;
	}
	final String? userNo = jsonConvert.convert<String>(json['userNo']);
	if (userNo != null) {
		awardRecordsDataResult.userNo = userNo;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		awardRecordsDataResult.userName = userName;
	}
	final String? plant = jsonConvert.convert<String>(json['plant']);
	if (plant != null) {
		awardRecordsDataResult.plant = plant;
	}
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		awardRecordsDataResult.level = level;
	}
	final int? howmuch = jsonConvert.convert<int>(json['howmuch']);
	if (howmuch != null) {
		awardRecordsDataResult.howmuch = howmuch;
	}
	final String? reverse1 = jsonConvert.convert<String>(json['reverse1']);
	if (reverse1 != null) {
		awardRecordsDataResult.reverse1 = reverse1;
	}
	final String? reverse2 = jsonConvert.convert<String>(json['reverse2']);
	if (reverse2 != null) {
		awardRecordsDataResult.reverse2 = reverse2;
	}
	final String? reverse3 = jsonConvert.convert<String>(json['reverse3']);
	if (reverse3 != null) {
		awardRecordsDataResult.reverse3 = reverse3;
	}
	final String? reverse4 = jsonConvert.convert<String>(json['reverse4']);
	if (reverse4 != null) {
		awardRecordsDataResult.reverse4 = reverse4;
	}
	final String? reverse5 = jsonConvert.convert<String>(json['reverse5']);
	if (reverse5 != null) {
		awardRecordsDataResult.reverse5 = reverse5;
	}
	return awardRecordsDataResult;
}

Map<String, dynamic> $AwardRecordsDataResultToJson(AwardRecordsDataResult entity) {
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
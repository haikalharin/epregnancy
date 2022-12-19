// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_pending_patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatPendingPatientResponse _$$_ChatPendingPatientResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ChatPendingPatientResponse(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : ChatPendingPatientPageable.fromJson(
              json['pageable'] as Map<String, dynamic>),
      totalPages: json['total_pages'] as int?,
      totalElements: json['total_elements'] as int?,
      last: json['last'] as bool?,
      number: json['number'] as int?,
      sort: json['sort'] == null
          ? null
          : ChatPendingPatientSort.fromJson(
              json['sort'] as Map<String, dynamic>),
      size: json['size'] as int?,
      numberOfElements: json['number_of_elements'] as int?,
      first: json['first'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$$_ChatPendingPatientResponseToJson(
        _$_ChatPendingPatientResponse instance) =>
    <String, dynamic>{
      'content': instance.content?.map((e) => e.toJson()).toList(),
      'pageable': instance.pageable?.toJson(),
      'total_pages': instance.totalPages,
      'total_elements': instance.totalElements,
      'last': instance.last,
      'number': instance.number,
      'sort': instance.sort?.toJson(),
      'size': instance.size,
      'number_of_elements': instance.numberOfElements,
      'first': instance.first,
      'empty': instance.empty,
    };

_$_Content _$$_ContentFromJson(Map<String, dynamic> json) => _$_Content(
      id: json['id'] as String?,
      fromId: json['from_id'] as String?,
      hospitalId: json['hospital_id'] as String?,
      message: json['message'] as String?,
      imageUrl: json['image_url'] as String?,
      from: json['from'] == null
          ? null
          : ChatPendingPatientFrom.fromJson(
              json['from'] as Map<String, dynamic>),
      hospital: json['hospital'] == null
          ? null
          : ChatPendingPatientHospital.fromJson(
              json['hospital'] as Map<String, dynamic>),
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_id': instance.fromId,
      'hospital_id': instance.hospitalId,
      'message': instance.message,
      'image_url': instance.imageUrl,
      'from': instance.from?.toJson(),
      'hospital': instance.hospital?.toJson(),
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_from': instance.createdFrom,
      'created_date': instance.createdDate,
      'modified_by': instance.modifiedBy,
      'modified_from': instance.modifiedFrom,
      'modified_date': instance.modifiedDate,
    };

_$_ChatPendingPatientFrom _$$_ChatPendingPatientFromFromJson(
        Map<String, dynamic> json) =>
    _$_ChatPendingPatientFrom(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      isPatient: json['is_patient'] as bool?,
      isMidwife: json['is_midwife'] as bool?,
      isAdmin: json['is_admin'] as bool?,
      isSuperAdmin: json['is_super_admin'] as bool?,
      isVerified: json['is_verified'] as bool?,
      hospitalId: json['hospital_id'] as String?,
      hospital: json['hospital'] == null
          ? null
          : ChatPendingPatientHospital.fromJson(
              json['hospital'] as Map<String, dynamic>),
      imageUrl: json['image_url'] as String?,
      coverUrl: json['cover_url'] as String?,
    );

Map<String, dynamic> _$$_ChatPendingPatientFromToJson(
        _$_ChatPendingPatientFrom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'email': instance.email,
      'mobile': instance.mobile,
      'username': instance.username,
      'status': instance.status,
      'is_patient': instance.isPatient,
      'is_midwife': instance.isMidwife,
      'is_admin': instance.isAdmin,
      'is_super_admin': instance.isSuperAdmin,
      'is_verified': instance.isVerified,
      'hospital_id': instance.hospitalId,
      'hospital': instance.hospital?.toJson(),
      'image_url': instance.imageUrl,
      'cover_url': instance.coverUrl,
    };

_$_ChatPendingPatientHospital _$$_ChatPendingPatientHospitalFromJson(
        Map<String, dynamic> json) =>
    _$_ChatPendingPatientHospital(
      id: json['id'] as String?,
      alias: json['alias'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      status: json['status'] as String?,
      imageUrl: json['image_url'] as String?,
      coverUrl: json['cover_url'] as String?,
    );

Map<String, dynamic> _$$_ChatPendingPatientHospitalToJson(
        _$_ChatPendingPatientHospital instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'email': instance.email,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'image_url': instance.imageUrl,
      'cover_url': instance.coverUrl,
    };

_$_ChatPendingPatientPageable _$$_ChatPendingPatientPageableFromJson(
        Map<String, dynamic> json) =>
    _$_ChatPendingPatientPageable(
      sort: json['sort'] == null
          ? null
          : ChatPendingPatientSort.fromJson(
              json['sort'] as Map<String, dynamic>),
      offset: json['offset'] as int?,
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$$_ChatPendingPatientPageableToJson(
        _$_ChatPendingPatientPageable instance) =>
    <String, dynamic>{
      'sort': instance.sort,
      'offset': instance.offset,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

_$_ChatPendingPatientSort _$$_ChatPendingPatientSortFromJson(
        Map<String, dynamic> json) =>
    _$_ChatPendingPatientSort(
      empty: json['empty'] as bool?,
      sorted: json['sorted'] as bool?,
      unsorted: json['unsorted'] as bool?,
    );

Map<String, dynamic> _$$_ChatPendingPatientSortToJson(
        _$_ChatPendingPatientSort instance) =>
    <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };

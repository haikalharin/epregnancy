import 'package:PregnancyApp/data/model/base_model/pagination.dart';

class ResponseModel<T> {
  int? code;
  String? status;
  String? message;
  String? action;
  dynamic data;
  Pagination? pagination;

  /// Pagination from Mas Aamiin
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;
  List<T>? result;

  ResponseModel({
    this.code,
    this.pagination,
    this.status,
    this.message,
    this.action,
    this.data,
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
    this.result,
  });

  ResponseModel.fromJson(Map<String, dynamic> json, T fromJson(Map<String, dynamic> json)) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    action = json['action'];

    if (json["data"] != null && fromJson != null) {
      if (json['data'].toString()[0] == "[") {
        data = List<T>.from(json['data'].map((x) => fromJson(x)));
      } else {
        data = fromJson(json['data']);
      }
    }
    if(json["pagination"] != null){
      pagination = Pagination.fromJson(json['pagination']);
    }
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    from = json['from'];
    to = json['to'];
    if (json['result'] != null) {
      result = List<T>.from(json['result'].map((e) => fromJson(e)));
    }
  }

  ResponseModel<T> copyWith({
    int? statusCode,
    String? statusMessage,
    String? errorMessage,
    String? action,
    dynamic data,
    Pagination? pagination,
    int? total,
    int? perPage,
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    List<T>? result,
  }) {
    return ResponseModel<T>(
      code: statusCode ?? this.code,
      status: statusMessage ?? this.status,
      message: errorMessage ?? this.message,
      action: action ?? this.action,
      data: data ?? this.data,
      total: total ?? this.total,
      pagination: pagination ?? this.pagination,
      perPage: perPage ?? this.perPage,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      result: result ?? this.result,
    );
  }

  static void empty(Map<String, dynamic> json) {
    return;
  }

  static ResponseModel dataEmpty({dynamic data}) {
    return ResponseModel(
     code: 0,
      status: '',
      message: '',
      data: data,
      action: '',
    );
  }
}

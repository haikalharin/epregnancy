class
ResponseModel<T> {
  int? statusCode;
  String? statusMessage;
  String? errorMessage;
  dynamic data;

  /// Pagination from Mas Aamiin
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;
  List<T>? result;

  ResponseModel({
    this.statusCode,
    this.statusMessage,
    this.errorMessage,
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
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    errorMessage = json['errorMessage'];

    if (json["data"] != null && fromJson != null) {
      if (json['data'].toString()[0] == "[") {
        data = List<T>.from(json['data'].map((x) => fromJson(x)));
      } else {
        data = fromJson(json['data']);
      }
    }

    /// Pagination from Mas Aamiin
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
    dynamic data,
    int? total,
    int? perPage,
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    List<T>? result,
  }) {
    return ResponseModel<T>(
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      total: total ?? this.total,
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
}

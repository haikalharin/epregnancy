
dynamic getDataValue(dynamic result) => result;

dynamic getRoleArgument(dynamic result) => result['role'];

dynamic getInitialIndex(dynamic result) => result['initial_index'];

dynamic getUserId(dynamic result) => result['user_id'];

dynamic getDataCondition(dynamic result) => result['Condition'];

dynamic cekPersonInRoom(dynamic result) => result['inRoom'];

dynamic getPersonTokenFirebase(dynamic result) => result['token'];

dynamic getDateTimeFirebase(dynamic result) => result['dateTime'];

dynamic getPersonUid(dynamic result) => result['uid'];

dynamic getData(dynamic result) => result['data'];

int getCode(dynamic result) => result['code'];

dynamic getDataList(dynamic result) => result['total_results'];

dynamic getErrorResult(dynamic result) => result['error'];

String getFormattedUrl(String? url, Map<String, String>? variables) {
  return url!.replaceAllMapped(RegExp(r'{{\w+}}'), (match) {
    final key = match.group(0)!.replaceAll(RegExp(r'[{}]'), '');
    return variables![key]!;
  });
}


import 'package:PregnancyApp/data/model/baby_child_model/baby_child_response.dart';
import 'package:PregnancyApp/data/model/baby_progress_model/simple_tip_response.dart';
import 'package:PregnancyApp/data/model/biodata_model/biodata_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_list_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/last_chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
import 'package:PregnancyApp/data/model/child_model/child_list_response.dart';
import 'dart:math';

import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/games_model/play_game_response.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/login_model/login_response_data.dart';
import 'package:PregnancyApp/data/model/login_model/login_response_data.dart';
import 'package:PregnancyApp/data/model/members_model/members_summary_response.dart';
import 'package:PregnancyApp/data/model/my_child_dashboard/my_child_dashboard.dart';
import 'package:PregnancyApp/data/model/notification_model/notification_total_unread_model.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';

import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/point_model/checkin_response.dart';
import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';
import 'package:PregnancyApp/data/model/user_visit_model/user_visit_model.dart';
import 'package:http/http.dart';

import '../../common/network/http/http_client.dart';
import '../../common/remote/url/service_url.dart';
import '../../utils/remote_utils.dart';
import '../model/article_model/article_model.dart';
import '../model/baby_model/new_baby_model.dart';
import '../model/baby_model_api/baby_Model_api.dart';
import '../model/consultation_model/consultation_model.dart';
import '../model/growth_model/growth_model.dart';
import '../model/login_model/login_model.dart';
import '../model/members_model/member.dart';
import '../model/notification_model/notification_list_model.dart';
import '../model/response_model/response_model.dart';
import '../model/user_example_model/user_example_model.dart';
import '../model/user_model_api/signup_quest_request.dart';
import '../model/user_model_api/user_availability_response.dart';
import '../model/visit_hospital_model/visit_hospital_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({required this.httpClient});

  /***proses***/
  Future<List<UserExampleModel>> fetchUserList() async {
    final response = await httpClient.get(ServiceUrl.login);
    final data = <UserExampleModel>[];

    getData(response).forEach((item) {
      data.add(UserExampleModel.fromJson(item));
    });

    return data;
  }

  Future<ResponseModel<LoginResponseData>> login(LoginModel loginModel) async {
    final response =
        await httpClient.postLogin(ServiceUrl.newLogin, loginModel);

    return ResponseModel<LoginResponseData>.fromJson(
        response, LoginResponseData.fromJson);
  }

  Future<ResponseModel> forgotPassword(Map data) async {
    final response = await httpClient.post(ServiceUrl.forgotPassword, data);

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel> addChild(Map data) async {
    final response = await httpClient.post(ServiceUrl.childs, data);

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel> readNotification(Map data) async {
    final response = await httpClient.patch(ServiceUrl.notificationList, data);

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel> addGrowth(Map data, String? childId) async {
    final response = await httpClient.post(ServiceUrl.childs + "/$childId/${ServiceUrl.growths}", data);

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel> updateChild(Map data) async {
    final response = await httpClient.put(ServiceUrl.childs, data);

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel> updateBabyStatus(Map data) async {
    final response = await httpClient.put(ServiceUrl.updateBaby, data);

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel> deleteBabyList(String id) async {
    final response = await httpClient.delete(ServiceUrl.deleteBaby + "/" + id, {});

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel> deleteChild(String id) async {
    final response = await httpClient.delete(ServiceUrl.childs + "/$id", {});

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel<UserExampleModel>> loginOnine(
      UserExampleModel userModel) async {
    final response =
        await httpClient.post(ServiceUrl.loginMobile, userModel.toLoginJson());

//    return null;
    return ResponseModel<UserExampleModel>.fromJson(
        response, UserExampleModel.fromJson);
  }

  Future<List<UserExampleModel>> fetchListUser() async {
    final response = await httpClient.get(ServiceUrl.login);

    ResponseModel<dynamic> res = ResponseModel<UserExampleModel>.fromJson(
        response, UserExampleModel.fromJson);

    List<UserExampleModel> datas = res.data.toList();

    print(res);
    return datas;
  }

  Future<ResponseModel> register(UserModel user) async {
    try {
      final response = await httpClient.post(ServiceUrl.register, user);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateUser(SignupQuestRequest user) async {
    print("payload request : ${user.toJson()}");
    try {
      final response = await httpClient.put(ServiceUrl.updateUser, user);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateFcmToken(UserModel user) async {
    print("payload request : ${user.toJson()}");
    try {
      var data = {
        'fcm_token': user.fcmToken ?? "",
      };
      final response = await httpClient.put(ServiceUrl.updateUser, data);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateHospital(String hospitalId) async {
    try {
      final response = await httpClient
          .put(ServiceUrl.updateUserProfile, {"hospital_id": hospitalId});
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateDisclaimer(UserModel user) async {
    try {
      Map<String, dynamic> data = {
        'id': user.id ?? "",
        'is_agree': user.isAgree ?? false,
      };
      final response = await httpClient.put(ServiceUrl.updateUser, user);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> saveBaby(BabyModelApi baby) async {
    try {
      final response = await httpClient.post(ServiceUrl.saveBaby, baby);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateBaby(BabyModelApi baby,
      {bool isUpdateStatus = false}) async {
    try {
      Map<String, String> data = {};
      if (isUpdateStatus) {
        data = {
          'id': baby.id ?? "",
          'name': baby.name ?? "",
          'last_menstruation_date': baby.lastMenstruationDate ?? "",
          'status': baby.status ?? "",
        };
      } else {
        data = {
          'id': baby.id ?? "",
          'name': baby.name ?? "",
          'last_menstruation_date': baby.lastMenstruationDate ?? "",
        };
      }
      final response = await httpClient.put(ServiceUrl.updateBaby, data);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> deleteBaby(BabyModelApi baby) async {
    try {
      final response = await httpClient.delete(
          ServiceUrl.deleteBaby + '/' + '${baby.id}', null);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateQuestioner(UserModel user) async {
    try {
      final response = await httpClient.put(ServiceUrl.updateQuestioner, user);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> getListBaby(UserModel UserModel) async {
    try {
      Map<String, String> qParams = {'user_id': '${UserModel.id}'};
      final response =
          await httpClient.get(ServiceUrl.listBaby, queryParameters: qParams);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> getBaby(UserModel UserModel) async {
    try {
      final response = await httpClient.get(ServiceUrl.myBaby);
      return ResponseModel.fromJson(response, NewBabyModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> getBabyChilds() async {
    try {
      final response = await httpClient.get(ServiceUrl.babyChilds);
      return ResponseModel.fromJson(response, BabyChildResponse.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> getChildForDashboard(String childId) async {
    try {
      final response = await httpClient
          .get("${ServiceUrl.childs}/$childId/${ServiceUrl.myChild}");
      return ResponseModel.fromJson(response, MyChildDashboard.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }


  Future<ResponseModel<GrowthModel>> getAllGrowth(String childId) async {
    final response = await httpClient.get("${ServiceUrl.childs}/$childId/${ServiceUrl.growths}");
    return ResponseModel.fromJson(response, GrowthModel.fromJson);
  }

  Future<ResponseModel> requestOtp(Map data) async {
    try {
      final response = await httpClient.post(ServiceUrl.requestOtp, data);
      return ResponseModel.fromJson(response, OtpModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> verifyOtp(OtpModel otpModel) async {
    try {
      final response = await httpClient.post(ServiceUrl.verifyOtp, otpModel);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> pinSubmitCheckIn(String hospitalId, String pin) async {
    try {
      final response =
          await httpClient.post(ServiceUrl.userVisit, {"qr_string": pin});
      return ResponseModel.fromJson(response, VisitHospitalModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> checkUserExist(String user, String type) async {
    try {
      Map<String, String> data = {type: user};
      final response =
          await httpClient.post("${ServiceUrl.checkUserExist}/$type", data);
      return ResponseModel.fromJson(
          response, UserAvailabilityResponse.fromJson);
    } catch (e) {
      return ResponseModel(data: const UserModel());
    }
  }

  /// Article
  Future<ResponseModel> fetchListArticle() async {
    try {
      final response = await httpClient.get(ServiceUrl.listArticle);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  /// Consultation
  Future<ResponseModel<ConsultationModel>> fetchListConsultation() async {
    final response = await httpClient.get(ServiceUrl.listConsultation);

    return ResponseModel.fromJson(response, ConsultationModel.fromJson);
  }

  Future<ResponseModel> postConsultation(
      ConsultationModel consultationModel) async {
    Map<String, String> data;
    if (consultationModel.imageBase64 != null) {
      data = {
        'message': consultationModel.message!,
        'image_base64': consultationModel.imageBase64!
      };
    } else {
      data = {
        'message': consultationModel.message!,
      };
    }

    final response = await httpClient.post(ServiceUrl.postConsultation, data);

    return ResponseModel.fromJson(response, ConsultationModel.fromJson);
  }

  Future<ResponseModel> likeConsultation(
    String id,
  ) async {
    final response =
        await httpClient.post(ServiceUrl.consultation + "/$id" + "/like", null);

    return ResponseModel.fromJson(response, ConsultationModel.fromJson);
  }

  Future<ResponseModel> unLikeConsultation(
    String id,
  ) async {
    final response = await httpClient.post(
        ServiceUrl.consultation + "/$id" + "/unlike", null);

    return ResponseModel.fromJson(response, ConsultationModel.fromJson);
  }

  /// EventSchedule
  Future<ResponseModel<EventModel>> fetchListEvent(
      {String userId = '', bool isPublic = false}) async {
    Map<String, String> qParams = {
      'user_id': userId,
      'is_public': isPublic.toString()
    };
    final response =
        await httpClient.get(ServiceUrl.listSchedule, queryParameters: qParams);
    return ResponseModel.fromJson(response, EventModel.fromJson);
  }

  // fetch event for midwife
  Future<ResponseModel<EventModel>> fetchListEventForMidwife(
      {String midwifeId = '', bool isPublic = false}) async {
    Map<String, String> qParams = {
      'midwife_id': midwifeId,
      'is_public': isPublic.toString()
    };
    final response =
        await httpClient.get(ServiceUrl.listSchedule, queryParameters: qParams);
    return ResponseModel.fromJson(response, EventModel.fromJson);
  }

  Future<ResponseModel<Member>> fetchMembers(
      {String name = '',
      int? page,
      int? isPregnant,
      String? sortBy,
      String? sort}) async {
    Map<String, String> qParams = {
      'name': name,
      'page': page.toString(),
      'size': "10",
      'sort': "$sortBy,$sort",
    };
    if (isPregnant == 0) {
      qParams = {
        'name': name,
        'isPregnant': 'false',
        'page': page.toString(),
        'size': "10",
        'sort': "$sortBy,$sort",
      };
    } else if (isPregnant == 1) {
      qParams = {
        'name': name,
        'isPregnant': 'true',
        'page': page.toString(),
        'size': "10",
        'sort': "$sortBy,$sort",
      };
    }
    final response =
        await httpClient.get(ServiceUrl.patientUsers, queryParameters: qParams);
    return ResponseModel.fromJson(response, Member.fromJson);
  }

  Future<ResponseModel<Member>> fetchMidwifes(
      {String name = '', int? page}) async {
    Map<String, String> qParams = {
      'name': name,
      'isPregnant': "true",
      'page': page.toString(),
      'size': "10",
      'sort': "name,asc",
    };
    final response =
        await httpClient.get(ServiceUrl.midwifeUsers, queryParameters: qParams);
    return ResponseModel.fromJson(response, Member.fromJson);
  }

  Future<ResponseModel> saveScheduleEventPersonal(EventModel eventModel) async {
    try {
      final response =
          // old endpoint
          // await httpClient.post(ServiceUrl.saveSchedule, eventModel);
          await httpClient.post(
              ServiceUrl.createScheduleAppointmentMw, eventModel);
      return ResponseModel.fromJson(response, EventModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> addComment(String postId, String comment) async {
    try {
      final response = await httpClient.post(
          ServiceUrl.addComment + "$postId/add-comment", {"message": comment});
      return ResponseModel.fromJson(response, EventModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> saveScheduleEventMedicineFromMidwife(
      EventModel eventModel) async {
    try {
      final response = await httpClient.post(
          ServiceUrl.createScheduleMedicineMw, eventModel);
      return ResponseModel.fromJson(response, EventModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> saveScheduleEventAppointmentFromMidwife(
      EventModel eventModel) async {
    try {
      final response = await httpClient.post(
          ServiceUrl.createScheduleAppointmentMw, eventModel);
      return ResponseModel.fromJson(response, EventModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> deleteScheduleEventPersonal(String id) async {
    try {
      Map<String, String> data = {
        'id': id,
      };
      final response = await httpClient.delete(ServiceUrl.deleteSchedule, data);
      return ResponseModel.fromJson(response, EventModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> deletePost(String id) async {
    try {
      Map<String, String> data = {
        'id': id,
      };
      final response = await httpClient.delete(ServiceUrl.deletePost, data);
      return ResponseModel.fromJson(response, EventModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> biodataView(String password) async {
    try {
      Map<String, String> data = {
        'password': password,
      };
      final response = await httpClient.post(ServiceUrl.biodata, data);
      return ResponseModel.fromJson(response, BiodataResponse.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> deleteComment(String id) async {
    try {
      Map<String, String> data = {
        'id': id,
      };
      final response = await httpClient.delete(
          ServiceUrl.deletePostComment + id.toString(), data);
      return ResponseModel.fromJson(response, EventModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> postUK(Map<String, dynamic> ujiKelayakan) async {
    final response = await httpClient.post(ServiceUrl.login, ujiKelayakan);
    return ResponseModel.fromJson(response, ResponseModel.empty);
  }

  Future<ResponseModel> verifikasiOrKoreksi(
      UserExampleModel userModel, String ukRegNo) async {
    final response = await httpClient.put(
        ServiceUrl.login + "/" + ukRegNo, userModel.toJson());

//    return null;
    return ResponseModel.fromJson(response, ResponseModel.empty);
  }

  Future<ResponseModel<UserModel>> getUserInfo() async {
    final response = await httpClient.get(ServiceUrl.userInfo);

//    return null;
    return ResponseModel<UserModel>.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel<CheckinResponse>> hitCheckInToday(String day) async {
    // final response = await httpClient.post(ServiceUrl.checkIn + day, {});
    final response = await httpClient.post(ServiceUrl.checkIn, {});

//    return null;
    return ResponseModel<CheckinResponse>.fromJson(
        response, CheckinResponse.fromJson);
  }

  Future<ResponseModel<PointHistory>> fetchPointHistory() async {
    final response = await httpClient.get(ServiceUrl.pointHistory);

    return ResponseModel.fromJson(response, PointHistory.fromJson);
  }

  Future<ResponseModel<GamesResponse>> fetchGameList() async {
    final response = await httpClient.get(ServiceUrl.gameList);

    return ResponseModel.fromJson(response, GamesResponse.fromJson);
  }

  Future<ResponseModel<ChildListResponse>> fetchChildList() async {
    final response = await httpClient.get(ServiceUrl.childs);

    return ResponseModel.fromJson(response, ChildListResponse.fromJson);
  }

  Future<ResponseModel> changePassword(
      String currentPassword, String newPassword) async {
    Map<String, String> data = {
      'old_password': currentPassword,
      'new_password': newPassword
    };
    final response = await httpClient.post(ServiceUrl.changePassword, data);

    return ResponseModel.fromJson(response, ConsultationModel.fromJson);
  }

  Future<ResponseModel<ChatResponse>> fetchLatestChat() async {
    final response = await httpClient.get(ServiceUrl.latestChat);

    return ResponseModel.fromJson(response, ChatResponse.fromJson);
  }

  Future<ResponseModel<ChatResponse>> fetchPersonalChatRoom(
      String id, bool archive) async {
    String url = '';

    if (archive) {
      url = ServiceUrl.archivePersonalChatRoom;
    } else {
      url = ServiceUrl.personalChatRoom;
    }

    final response = await httpClient.get(url + id);
    return ResponseModel.fromJson(response, ChatResponse.fromJson);
  }

  Future<ResponseModel<ChatPendingResponseList>> fetchChatPendingList() async {
    final response = await httpClient.get(ServiceUrl.chatPendingList);
    return ResponseModel.fromJson(response, ChatPendingResponseList.fromJson);
  }

  Future<ResponseModel<ChatPendingSendResponse>> chatPendingSend(
      ChatPendingSendRequest _requestBody) async {
    final response = await httpClient.post(
        ServiceUrl.chatPendingSend, _requestBody.toJson());

//    return null;
    return ResponseModel<ChatPendingSendResponse>.fromJson(
        response, ChatPendingSendResponse.fromJson);
  }

  Future<ResponseModel<ChatResponse>> chatSend(
      ChatSendRequest _requestBody) async {
    var _request;
    if (_requestBody.imageBase64 == null) {
      _request = {
        "from_id": _requestBody.fromId,
        "to_id": _requestBody.toId,
        "message": _requestBody.message,
      };
    } else {
      _request = {
        "from_id": _requestBody.fromId,
        "to_id": _requestBody.toId,
        "message": _requestBody.message,
        "image_base64": _requestBody.imageBase64
      };
    }
    final response = await httpClient.post(ServiceUrl.sendChat, _request);

//    return null;
    return ResponseModel<ChatResponse>.fromJson(
        response, ChatResponse.fromJson);
  }

  Future<ResponseModel<ChatListResponse>> fetchChatListResponse(
      String fromId) async {
    final response = await httpClient
        .get(ServiceUrl.latestChat, queryParameters: {'from_id': fromId});

    return ResponseModel.fromJson(response, ChatListResponse.fromJson);
  }

  Future<ResponseModel<PlayGameResponse>> pointForPlayGame(
      String gameId) async {
    final response = await httpClient.get(ServiceUrl.gamePlay + gameId);

    return ResponseModel<PlayGameResponse>.fromJson(
        response, PlayGameResponse.fromJson);
  }

  Future<ResponseModel<ChatListResponse>> fetchChatListByToIdResponse(
      String toId) async {
    final response = await httpClient
        .get(ServiceUrl.latestChat, queryParameters: {'to_id': toId});

    return ResponseModel.fromJson(response, ChatListResponse.fromJson);
  }

  Future<ResponseModel<ChatListResponse>> fetchArchiveChatListByFromIdResponse(
      String fromId) async {
    final response = await httpClient
        .get(ServiceUrl.chatArchiveList, queryParameters: {'from_id': fromId});

    return ResponseModel.fromJson(response, ChatListResponse.fromJson);
  }

  Future<ResponseModel<ChatListResponse>> fetchArchiveChatListByToIdResponse(
      String toId) async {
    final response = await httpClient
        .get(ServiceUrl.chatArchiveList, queryParameters: {'to_id': toId});

    return ResponseModel.fromJson(response, ChatListResponse.fromJson);
  }

  Future<ResponseModel<ChatPendingPatientResponse>> fetchChatPendingPatient(
      String fromId, String hospitalId) async {
    final response = await httpClient.get(ServiceUrl.chatPendingPatient,
        queryParameters: {'from_id': fromId, 'hospital_id': hospitalId});

//    return null;
    return ResponseModel<ChatPendingPatientResponse>.fromJson(
        response, ChatPendingPatientResponse.fromJson);
  }

  Future<ResponseModel<HospitalModel>> fetchHospitals(String name) async {
    final response = await httpClient
        .get(ServiceUrl.hospitalList, queryParameters: {'name': name});

    return ResponseModel.fromJson(response, HospitalModel.fromJson);
  }

  Future<ResponseModel<UserModel>> fetchUsers(String name) async {
    final response = await httpClient.get(ServiceUrl.userList,
        queryParameters: {
          'name': name,
          'is_midwife': "false",
          'is_patient': "true"
        });

    return ResponseModel.fromJson(response, UserModel.fromJson);
  }

  Future<ResponseModel<HospitalModel>> fetchHospitalsById(String id) async {
    final response = await httpClient
        .get(ServiceUrl.hospitalList, queryParameters: {'id': id});

    return ResponseModel.fromJson(response, HospitalModel.fromJson);
  }

  Future<ResponseModel<ChatResponse>> nakesResponseChatPending(
      String fromId, String hospitalId) async {
    final response = await httpClient.post(ServiceUrl.chatPendingResponse,
        {"from_id": fromId, "hospital_id": hospitalId});

    return ResponseModel<ChatResponse>.fromJson(
        response, ChatResponse.fromJson);
  }

  Future<ResponseModel<ChatPendingResponseList>> fetchChatPendingByHospitalId(
      String hospitalId) async {
    final response =
        await httpClient.get(ServiceUrl.chatPendingListForNakes + hospitalId);
    return ResponseModel.fromJson(response, ChatPendingResponseList.fromJson);
  }

  Future<ResponseModel<LastChatResponse>> fetchLastChatDashboard() async {
    final response = await httpClient.get(ServiceUrl.lastChat);
    return ResponseModel.fromJson(response, LastChatResponse.fromJson);
  }

  Future<ResponseModel> updatePhotoProfile(
      String userId, String imgProfile) async {
    try {
      Map<String, String> data = {'id': userId, 'image_base64': imgProfile};
      final response = await httpClient.put(ServiceUrl.updateUser, data);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel<ArticleModel>> fetchArticle(
      {String title = '',
      String category = '',
      int? page,
      String? sortBy,
      String? sort}) async {
    Map<String, String> qParams = {
      'title': title,
      'category': category,
      'page': page.toString(),
      'size': "10",
      'sort': "$sortBy,$sort",
    };
    final response =
        await httpClient.get(ServiceUrl.listArticle, queryParameters: qParams);
    return ResponseModel.fromJson(response, ArticleModel.fromJson);
  }

  Future<ResponseModel<NotificationListModel>> fetchNotification(
      {int? page}) async {
    Map<String, String> qParams = {
      'page': page.toString(),
      'size': "10",
    };
    final response = await httpClient.get(ServiceUrl.notificationList,
        queryParameters: qParams);
    return ResponseModel.fromJson(response, NotificationListModel.fromJson);
  }

  Future<ResponseModel<NotificationTotalUnreadModel>> fetchNotificationTotalUnread() async {
    final response = await httpClient.get(ServiceUrl.notificationTotalUnread);
    return ResponseModel.fromJson(response, NotificationTotalUnreadModel.fromJson);
  }

  Future<List<ArticleModel>> searchArticle(
      bool isSearch, String keyword) async {
    Map<String, String> param = {
      'title': keyword,
    };
    final response =
        await httpClient.get(ServiceUrl.listArticle, queryParameters: param);
    final data = <ArticleModel>[];
    getData(response).forEach((item) {
      data.add(ArticleModel.fromJson(item));
    });
    return data;
  }

  Future<ResponseModel> readArticle(String id) async {
    try {
      final response = await httpClient.get(ServiceUrl.readArticle + "/$id");
      return ResponseModel.fromJson(response, ArticleModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel<SimpleTipResponse>> getSimpleTip() async {
    final response = await httpClient.get(ServiceUrl.simpleTip);
    return ResponseModel.fromJson(response, SimpleTipResponse.fromJson);
  }

  Future<ResponseModel<MembersSummaryResponse>> getMembersSummary() async {
    final response = await httpClient.get(ServiceUrl.userTotal);
    return ResponseModel.fromJson(response, MembersSummaryResponse.fromJson);
  }

  Future<int> endChat(String toId) async {
    try {
      int responseCode = 500;
      final response = await httpClient.get(ServiceUrl.endChat + toId);
      responseCode = response['code'] ?? 500;
      return responseCode;
    } catch (e) {
      print('error end chat ${e.toString()}');
      return 500;
    }
  }

  Future<ResponseModel<UserVisitModel>> fetchUserVisit(
      {int? page, int? size, String? sortBy, String? sort}) async {
    Map<String, String> qParams = {
      'page': page.toString(),
      'size': size.toString(),
      'sort': "$sortBy,$sort",
    };
    final response =
        await httpClient.get(ServiceUrl.userVisit, queryParameters: qParams);
    return ResponseModel.fromJson(response, UserVisitModel.fromJson);
  }

  Future<ResponseModel> submitNextVisit(
      String id, String nextVisitDate, String status) async {
    try {
      Map<String, String> data = {
        'id': id,
        'status': status,
        'next_visit_date': nextVisitDate,
        'next_visit_time': '08:00:00',
      };
      final response = await httpClient.patch(ServiceUrl.userVisit, data);
      return ResponseModel.fromJson(response, UserVisitModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }
}

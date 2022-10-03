import 'package:PregnancyApp/data/model/chat_model/chat_list_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
import 'dart:math';

import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';

import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/point_model/checkin_response.dart';
import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';

import '../../common/network/http/http_client.dart';
import '../../common/remote/url/service_url.dart';
import '../../utils/remote_utils.dart';
import '../model/baby_model_api/baby_Model_api.dart';
import '../model/consultation_model/consultation_model.dart';
import '../model/login_model/login_model.dart';
import '../model/response_model/response_model.dart';
import '../model/user_example_model/user_example_model.dart';
import '../model/user_model_api/signup_quest_request.dart';

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

  Future<ResponseModel> login(LoginModel loginModel) async {
    final response = await httpClient.post(ServiceUrl.login, loginModel);

    return ResponseModel<UserModel>.fromJson(response, UserModel.fromJson);
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
    try {
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

  Future<ResponseModel> updateBaby(BabyModelApi baby) async {
    try {
      final response = await httpClient.post(ServiceUrl.updateBaby, baby);
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

  Future<ResponseModel> getBaby(UserModel UserModel) async {
    try {
      Map<String, String> qParams = {'user_id': '${UserModel.id}'};
      final response =
          await httpClient.get(ServiceUrl.listBaby, queryParameters: qParams);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> requestOtp(OtpModel otpModel) async {
    try {
      final response = await httpClient.post(ServiceUrl.requestOtp, otpModel);
      return ResponseModel.fromJson(response, OtpModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> loginOtp(OtpModel otpModel) async {
    try {
      final response = await httpClient.post(ServiceUrl.loginOtp, otpModel);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel<UserModel>> checkUserExist(String user) async {
    try {
      Map<String, String> data = {'username': user};
      final response = await httpClient.post(ServiceUrl.checkUserExist, data);
      return ResponseModel.fromJson(response, UserModel.fromJson);
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

  Future<ResponseModel> postConsultation(ConsultationModel consultationModel) async {
    Map<String, String> data;
    if(consultationModel.imageBase64 !=null){
      data =  {
        'message': consultationModel.message!,
        'image_base64':consultationModel.imageBase64!
      };
    } else{
      data =  {
        'message': consultationModel.message!,
      };
    }

    final response = await httpClient.post(ServiceUrl.postConsultation,data);

    return ResponseModel.fromJson(response, ConsultationModel.fromJson);
  }

  Future<ResponseModel> likeConsultation(String id,) async {

    final response = await httpClient.post(ServiceUrl.consultation +"/$id"+"/like", null);

    return ResponseModel.fromJson(response, ConsultationModel.fromJson);
  }

  Future<ResponseModel> unLikeConsultation(String id,) async {

    final response = await httpClient.post(ServiceUrl.consultation +"/$id"+"/unlike", null);

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

  Future<ResponseModel> saveScheduleEventPersonal(EventModel eventModel) async {
    try {
      final response =
          await httpClient.post(ServiceUrl.saveSchedule, eventModel);
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

  Future<ResponseModel<UserInfo>> getUserInfo() async {
    final response = await httpClient.get(ServiceUrl.userInfo);

//    return null;
    return ResponseModel<UserInfo>.fromJson(response, UserInfo.fromJson);
  }

  Future<ResponseModel<CheckinResponse>> hitCheckInToday(String day) async {
    final response = await httpClient.post(ServiceUrl.checkIn + day, {});

//    return null;
    return ResponseModel<CheckinResponse>.fromJson(
        response, CheckinResponse.fromJson);
  }

  Future<List<PointHistory>> fetchPointHistory() async {
    final response = await httpClient.get(ServiceUrl.pointHistory);
    final data = <PointHistory>[];
    getData(response).forEach((item) {
      data.add(PointHistory.fromJson(item));
    });
    return data;
  }

  Future<List<GamesResponse>> fetchGameList() async {
    final response = await httpClient.get(ServiceUrl.gameList);
    final data = <GamesResponse>[];
    getData(response).forEach((item) {
      data.add(GamesResponse.fromJson(item));
    });
    return data;
  }

  Future<List<ChatResponse>> fetchLatestChat() async {
    final response = await httpClient.get(ServiceUrl.latestChat);
    final data = <ChatResponse>[];
    getData(response).forEach((item) {
      data.add(ChatResponse.fromJson(item));
    });
    return data;
  }

  Future<List<ChatResponse>> fetchPersonalChatRoom(String id) async {
    final response = await httpClient.get(ServiceUrl.personalChatRoom + id);
    final data = <ChatResponse>[];
    getData(response).forEach((item) {
      data.add(ChatResponse.fromJson(item));
    });
    return data;
  }

  Future<List<ChatPendingResponseList>> fetchChatPendingList() async {
    final response = await httpClient.get(ServiceUrl.chatPendingList);
    final data = <ChatPendingResponseList>[];
    getData(response).forEach((item) {
      data.add(ChatPendingResponseList.fromJson(item));
    });
    return data;
  }

  Future<ResponseModel<ChatPendingSendResponse>> chatPendingSend(ChatPendingSendRequest _requestBody) async {
    final response = await httpClient.post(ServiceUrl.chatPendingSend, _requestBody.toJson());

//    return null;
    return ResponseModel<ChatPendingSendResponse>.fromJson(response, ChatPendingSendResponse.fromJson);
  }

  Future<ResponseModel<ChatResponse>> chatSend(ChatSendRequest _requestBody) async {
    final response = await httpClient.post(ServiceUrl.sendChat, _requestBody.toJson());

//    return null;
    return ResponseModel<ChatResponse>.fromJson(response, ChatResponse.fromJson);
  }

  Future<List<ChatListResponse>> fetchChatListResponse(String fromId) async {
    final response = await httpClient.get(ServiceUrl.chatList, queryParameters: {'to_id': fromId});
    final data = <ChatListResponse>[];
    getData(response).forEach((item) {
      data.add(ChatListResponse.fromJson(item));
    });
    return data;
  }

  Future<ResponseModel<ChatPendingPatientResponse>> fetchChatPendingPatient(String fromId, String hospitalId) async {
    final response = await httpClient.get(ServiceUrl.chatPendingPatient, queryParameters: {'from_id': fromId, 'hospital_id': hospitalId});

//    return null;
    return ResponseModel<ChatPendingPatientResponse>.fromJson(response, ChatPendingPatientResponse.fromJson);
  }

  Future<List<HospitalModel>> fetchHospitals(String name) async {
    final response = await httpClient.get(ServiceUrl.hospitalList, queryParameters: {'name': name});
    final data = <HospitalModel>[];
    getData(response).forEach((item) {
      data.add(HospitalModel.fromJson(item));
    });
    return data;
  }

  Future<List<ChatResponse>> nakesResponseChatPending(String fromId, String hospitalId) async {
    final response = await httpClient.post(ServiceUrl.chatPendingResponse, {"from_id": fromId, "hospital_id": hospitalId});
    final data = <ChatResponse>[];
    getData(response).forEach((item) {
      data.add(ChatResponse.fromJson(item));
    });
    return data;
  }

  Future<List<ChatPendingResponseList>> fetchChatPendingByHospitalId(String hospitalId) async {
    final response = await httpClient.get(ServiceUrl.chatPendingListForNakes + hospitalId);
    final data = <ChatPendingResponseList>[];
    getData(response).forEach((item) {
      data.add(ChatPendingResponseList.fromJson(item));
    });
    return data;
  }
}

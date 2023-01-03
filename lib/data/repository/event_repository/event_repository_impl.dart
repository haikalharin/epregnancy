import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../firebase/event/event_article.dart';
import '../../model/event_model/event_model.dart';
import '../../model/response_model/response_model.dart';
import '../../remote_datasource/remote_datasource.dart';
import 'event_repository.dart';

class EventRepositoryImpl extends EventRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  EventRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<ResponseModel<EventModel>> fetchEvent(
      {String? userId, bool? isPublic}) async {
    if (await networkInfo.isConnected) {
      ResponseModel<EventModel> listEvent = await remoteDatasource
          .fetchListEvent(userId: userId ?? '', isPublic: isPublic ?? false);
      return listEvent;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<EventModel>> fetchEventForMidwife(
      {String? midwifeId, bool? isPublic}) async {
    if (await networkInfo.isConnected) {
      ResponseModel<EventModel> listEvent = await remoteDatasource
          .fetchListEventForMidwife(midwifeId: midwifeId ?? '', isPublic: isPublic ?? false);
      return listEvent;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> saveEvent(EventModel eventModel) async {
    if (await networkInfo.isConnected) {
      ResponseModel response = await remoteDatasource.saveScheduleEventPersonal(eventModel);
      return response;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> saveEventMedicineFromMidwife(EventModel eventModel) async {
    if (await networkInfo.isConnected) {
      ResponseModel response = await remoteDatasource.saveScheduleEventMedicineFromMidwife(eventModel);
      return response;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> saveEventAppointmentFromMidwife(EventModel eventModel) async {
    if (await networkInfo.isConnected) {
      ResponseModel response = await remoteDatasource.saveScheduleEventAppointmentFromMidwife(eventModel);
      return response;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> deleteEvent(String id) async {
    if (await networkInfo.isConnected) {
      ResponseModel response =
      await remoteDatasource.deleteScheduleEventPersonal(id);
      return response;
    }
    throw NetworkConnectionException();
  }
}

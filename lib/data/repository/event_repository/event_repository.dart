import '../../model/event_model/event_model.dart';
import '../../model/response_model/response_model.dart';

abstract class EventRepository {
  Future <ResponseModel<EventModel>> fetchEvent({String? userId, bool? isPublic});
  Future <ResponseModel<EventModel>> fetchEventForMidwife({String? midwifeId, bool? isPublic});
  Future <ResponseModel> saveEvent(EventModel eventModel);
  Future <ResponseModel> saveEventAppointmentFromMidwife(EventModel eventModel);
  Future <ResponseModel> saveEventMedicineFromMidwife(EventModel eventModel);
  Future <ResponseModel> saveEventMedicine(EventModel eventModel);
  Future <ResponseModel> deleteEvent(String id);

}
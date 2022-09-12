import '../../model/event_model/event_model.dart';
import '../../model/response_model/response_model.dart';

abstract class EventRepository {
  Future <ResponseModel<EventModel>> fetchEvent({String? userId});
  Future <ResponseModel> saveEvent(EventModel eventModel);

}
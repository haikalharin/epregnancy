import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';

import '../../model/event_model/event_model.dart';
import '../../model/response_model/response_model.dart';

abstract class ConsultationRepository {
  Future <ResponseModel<ConsultationModel>> fetchListConsultation();

}
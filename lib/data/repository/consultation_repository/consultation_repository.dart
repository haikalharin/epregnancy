import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';

import '../../model/event_model/event_model.dart';
import '../../model/response_model/response_model.dart';

abstract class ConsultationRepository {
  Future <ResponseModel<ConsultationModel>> fetchListConsultation();
  Future <ResponseModel> postConsultation(ConsultationModel consultationModel);
  Future <ResponseModel> likeConsultation(String id, bool isLike);
  Future <ResponseModel> deletePost(String id);
  Future <ResponseModel> deletePostComment(String id);
  Future <ResponseModel> addComment(String postId, String comment);
}
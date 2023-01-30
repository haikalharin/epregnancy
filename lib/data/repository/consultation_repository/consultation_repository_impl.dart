import 'package:PregnancyApp/data/model/consultation_model/add_comment_response.dart';
import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../model/response_model/response_model.dart';
import '../../remote_datasource/remote_datasource.dart';
import 'consultation_repository.dart';

class ConsultationRepositoryImpl extends ConsultationRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  ConsultationRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<ResponseModel<ConsultationModel>> fetchListConsultation() async {
    if (await networkInfo.isConnected) {
      ResponseModel<ConsultationModel> listConsultation = await remoteDatasource.fetchListConsultation();
      return listConsultation;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> postConsultation(ConsultationModel consultationModel) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.postConsultation(consultationModel);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> addComment(String postId, String comment) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.addComment(postId, comment);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> likeConsultation(String id, bool isLike) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = ResponseModel.dataEmpty();
      if(isLike) {
         responseModel = await remoteDatasource.likeConsultation(id);
      } else{
        responseModel = await remoteDatasource.unLikeConsultation(id);
      }
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> deletePost(String id) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.deletePost(id);
      return responseModel;
    }
    throw NetworkConnectionException();
  }




}


import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/members_model/members_summary_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';

import '../../../pages/members_page/members_page.dart';
import '../../model/members_model/member.dart';

abstract class HospitalRepository {
  Future<ResponseModel<HospitalModel>> fetchHospitals(String name);
  Future<ResponseModel<HospitalModel>> fetchHospitalsById(String id);
  Future<ResponseModel<MembersSummaryResponse>> fetchMembersSummary();
  Future<ResponseModel<Member>> fetchMembers(String name, int page, int isPregnant,String sortBy, String sort);
  Future<ResponseModel<Member>> fetchMidwifes(String name, int page);

}
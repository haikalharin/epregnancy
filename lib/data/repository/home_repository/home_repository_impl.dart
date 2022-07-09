import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../firebase/event/event_user.dart';
import '../../model/baby_model/baby_model.dart';
import '../../model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../remote_datasource/remote_datasource.dart';
import '../../shared_preference/app_shared_preference.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  HomeRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<UserModelFirebase> fetchUser() async {
    if (await networkInfo.isConnected) {
      UserModelFirebase userModelFirebase =
          await AppSharedPreference.getUserFirebase();
      final UserRolesModelFirebase role =
      await EventUser.checkRoleExist(
          userModelFirebase.uid ?? "");
      final BabyModel baby = await EventUser.checkBabyExist(userModelFirebase.uid!);

      if (userModelFirebase.email!.isNotEmpty) {

        await AppSharedPreference.setUserRoleFirebase(role);
        await AppSharedPreference.setUserBabyFirebase(baby);
        return userModelFirebase;
      } else {
        return UserModelFirebase.empty();
      }
    }
    throw NetworkConnectionException();
  }
}

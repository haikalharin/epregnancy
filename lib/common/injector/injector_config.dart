
import 'package:PregnancyApp/common/services/auth_service.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository_impl.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../data/remote_datasource/remote_datasource.dart';
import '../../data/repository/user_repository/user_repository.dart';
import '../../data/repository/user_repository/user_repository_impl.dart';
import '../../login_page/bloc/login_bloc.dart';
import '../network/http/http_client.dart';
import '../network/network_info.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer? container;

  static void setup() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    // ignore: cascade_invocations
    injector._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container!.resolve;

  void _configure() {
    _configureInsuranceModule();
  }

  void _configureInsuranceModule() {
    _configureBlocs();
    _configureRepositories();
    _configureDataSources();
    _configureExternal();
    _configureCommon();
    _configureUtils();
    _configureDao();
  }


  @Register.singleton(LoginExampleBloc)
  @Register.singleton(LoginBloc)
  @Register.singleton(HomePageBloc)
  void _configureBlocs();

  @Register.factory(UserRepository, from: UserRepositoryImpl)
  @Register.factory(HomeRepository, from: HomeRepositoryImpl)
  void _configureRepositories();

  @Register.factory(RemoteDataSource)
  void _configureDataSources();

  @Register.singleton(HttpClient)
  void _configureExternal();

  @Register.factory(NetworkInfoImpl)
  void _configureCommon();

  // @Register.singleton(Ticker)
  void _configureUtils();

  // @Register.factory(CommunityDao)
  // @Register.factory(UserDao)
  void _configureDao();
}


import 'package:PregnancyApp/common/services/auth_service.dart';
import 'package:PregnancyApp/data/repository/article_repository/article_repository.dart';
import 'package:PregnancyApp/data/repository/article_repository/article_repository_impl.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository_impl.dart';
import 'package:PregnancyApp/data/repository/event_repository/event_repository.dart';
import 'package:PregnancyApp/data/repository/event_repository/event_repository_impl.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository_impl.dart';
import 'package:PregnancyApp/data/repository/hospital_repository/hospital_repository.dart';
import 'package:PregnancyApp/data/repository/hospital_repository/hospital_repository_impl.dart';
import 'package:PregnancyApp/pages/article_page/bloc/article_bloc.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:PregnancyApp/pages/event_page/bloc/event_page_bloc.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/pages/games_page/bloc/games_bloc.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/landing_page/bloc/landing_page_bloc.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/bloc/chat_pending_bloc.dart';
import 'package:PregnancyApp/pages/otp_page/bloc/otp_page_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/poin_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/point_history_bloc.dart';
import 'package:PregnancyApp/pages/signup_page/bloc/signup_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../data/remote_datasource/remote_datasource.dart';
import '../../data/repository/consultation_repository/consultation_repository.dart';
import '../../data/repository/consultation_repository/consultation_repository_impl.dart';
import '../../data/repository/user_repository/user_repository.dart';
import '../../data/repository/user_repository/user_repository_impl.dart';
import '../../pages/change_password_page/bloc/change_password_bloc.dart';
import '../../pages/consultation_page/bloc/consultation_page_bloc.dart';
import '../../pages/login_page/bloc/login_bloc.dart';
import '../../pages/profile_page/bloc/profile_page_bloc.dart';
import '../../pages/signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import '../../pages/splashscreen_page/bloc/splash_screen_bloc.dart';
import '../../pages/survey_page/bloc/survey_page_bloc.dart';
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
  @Register.singleton(SurveyPageBloc)
  @Register.singleton(ArticlePageBloc)
  @Register.singleton(SignupBloc)
  @Register.singleton(SignUpQuestionnaireBloc)
  @Register.singleton(SplashscreenBloc)
  @Register.singleton(EventPageBloc)
  @Register.singleton(PoinBloc)
  @Register.singleton(PointHistoryBloc)
  @Register.singleton(GamesBloc)
  @Register.singleton(OtpPageBloc)
  @Register.singleton(LandingPageBloc)
  @Register.singleton(ConsultationPageBloc)
  @Register.singleton(ChangePasswordBloc)
  @Register.singleton(ChatBloc)
  @Register.singleton(HospitalBloc)
  @Register.singleton(ChatPendingBloc)
  @Register.singleton(ProfilePageBloc)
  void _configureBlocs();

  @Register.factory(UserRepository, from: UserRepositoryImpl)
  @Register.factory(HomeRepository, from: HomeRepositoryImpl)
  @Register.factory(ArticleRepository, from: ArticleRepositoryImpl)
  @Register.factory(ChatRepository, from: ChatRepositoryImpl)
  @Register.factory(EventRepository, from: EventRepositoryImpl)
  @Register.factory(ConsultationRepository, from: ConsultationRepositoryImpl)
  @Register.factory(HospitalRepository, from: HospitalRepositoryImpl)
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

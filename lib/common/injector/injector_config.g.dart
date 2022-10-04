// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => LoginExampleBloc(c<UserRepository>()))
      ..registerSingleton((c) => LoginBloc(c<UserRepository>()))
      ..registerSingleton((c) => HomePageBloc(
          c<HomeRepository>(), c<UserRepository>(), c<EventRepository>()))
      ..registerSingleton((c) => SurveyPageBloc(c<UserRepository>()))
      ..registerSingleton((c) => ArticlePageBloc(c<UserRepository>()))
      ..registerSingleton((c) => SignupBloc(c<UserRepository>()))
      ..registerSingleton((c) => SignUpQuestionnaireBloc(c<UserRepository>()))
      ..registerSingleton((c) => SplashscreenBloc())
      ..registerSingleton((c) => EventPageBloc(c<EventRepository>()))
      ..registerSingleton((c) => PoinBloc(c<UserRepository>()))
      ..registerSingleton((c) => PointHistoryBloc(c<UserRepository>()))
      ..registerSingleton((c) => GamesBloc(c<HomeRepository>()))
      ..registerSingleton((c) => OtpPageBloc(c<UserRepository>()))
      ..registerSingleton((c) => LandingPageBloc(c<UserRepository>()))
      ..registerSingleton(
          (c) => ConsultationPageBloc(c<ConsultationRepository>()))
      ..registerSingleton((c) => ChangePasswordBloc(c<UserRepository>()));
          (c) => ConsultationPageBloc(c<ConsultationRepository>()))
      ..registerSingleton((c) => ChatBloc(c<ChatRepository>()))
      ..registerSingleton((c) => HospitalBloc(c<HospitalRepository>()))
      ..registerSingleton((c) => ChatPendingBloc(c<ChatRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<UserRepository>((c) =>
          UserRepositoryImpl(c<NetworkInfoImpl>(), c<RemoteDataSource>()))
      ..registerFactory<HomeRepository>((c) =>
          HomeRepositoryImpl(c<NetworkInfoImpl>(), c<RemoteDataSource>()))
      ..registerFactory<ArticleRepository>((c) =>
          ArticleRepositoryImpl(c<NetworkInfoImpl>(), c<RemoteDataSource>()))
      ..registerFactory<ChatRepository>((c) =>
          ChatRepositoryImpl(c<NetworkInfoImpl>(), c<RemoteDataSource>()))
      ..registerFactory<EventRepository>((c) =>
          EventRepositoryImpl(c<NetworkInfoImpl>(), c<RemoteDataSource>()))
      ..registerFactory<ConsultationRepository>((c) =>
          ConsultationRepositoryImpl(
              c<NetworkInfoImpl>(), c<RemoteDataSource>()))
      ..registerFactory<HospitalRepository>((c) =>
          HospitalRepositoryImpl(c<NetworkInfoImpl>(), c<RemoteDataSource>()));
  }

  @override
  void _configureDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerFactory((c) => RemoteDataSource(httpClient: c<HttpClient>()));
  }

  @override
  void _configureExternal() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => HttpClient());
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => NetworkInfoImpl());
  }

  @override
  void _configureUtils() {}
  @override
  void _configureDao() {}
}

import 'package:PregnancyApp/pages/notification_page/bloc/notification_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/article_page/bloc/article_bloc.dart';
import '../../pages/audio_page/bloc/audio_bloc.dart';
import '../../pages/change_password_page/bloc/change_password_bloc.dart';
import '../../pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import '../../pages/child_list_page/bloc/child_list_bloc.dart';
import '../../pages/consultation_page/bloc/comment_bloc.dart';
import '../../pages/consultation_page/bloc/consultation_page_bloc.dart';
import '../../pages/disclaimer_page/bloc/disclaimer_page_bloc.dart';
import '../../pages/event_page/bloc/event_page_bloc.dart';
import '../../pages/event_page/bloc/patient_select_bloc.dart';
import '../../pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import '../../pages/forgot_password_page/bloc/forgot_password_page_bloc.dart';
import '../../pages/games_page/bloc/games_bloc.dart';
import '../../pages/growth_page/bloc/growth_bloc.dart';
import '../../pages/home_page/bloc/home_page_bloc.dart';
import '../../pages/landing_page/bloc/landing_page_bloc.dart';
import '../../pages/location_select_page/bloc/hospital_bloc.dart';
import '../../pages/login_page/bloc/login_bloc.dart';
import '../../pages/nakes_page/bloc/chat_pending_bloc.dart';
import '../../pages/new_born_page/bloc/new_born_page_bloc.dart';
import '../../pages/otp_page/bloc/otp_page_bloc.dart';
import '../../pages/pin_checkin/bloc/pin_checkin_bloc.dart';
import '../../pages/poin_page/bloc/poin_bloc.dart';
import '../../pages/poin_page/bloc/point_history_bloc.dart';
import '../../pages/profile_page/bloc/profile_page_bloc.dart';
import '../../pages/signup_page/bloc/signup_bloc.dart';
import '../../pages/signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import '../../pages/splashscreen_page/bloc/splash_screen_bloc.dart';
import '../../pages/survey_page/bloc/survey_page_bloc.dart';
import '../injector/injector.dart';

List<BlocProvider> getProviders() => [
      BlocProvider<LoginExampleBloc>(
          create: (context) => Injector.container.resolve<LoginExampleBloc>()),
      BlocProvider<SignupBloc>(
          create: (context) => Injector.container.resolve<SignupBloc>()),
      BlocProvider<LoginBloc>(
          create: (context) => Injector.container.resolve<LoginBloc>()),
      BlocProvider<HomePageBloc>(
          create: (context) => Injector.container.resolve<HomePageBloc>()),
      BlocProvider<SurveyPageBloc>(
          create: (context) => Injector.container.resolve<SurveyPageBloc>()),
      BlocProvider<ArticlePageBloc>(
          create: (context) => Injector.container.resolve<ArticlePageBloc>()),
      BlocProvider<SignUpQuestionnaireBloc>(
          create: (context) =>
              Injector.container.resolve<SignUpQuestionnaireBloc>()),
      BlocProvider<SplashscreenBloc>(
          create: (context) => Injector.container.resolve<SplashscreenBloc>()),
      BlocProvider<EventPageBloc>(
          create: (context) => Injector.container.resolve<EventPageBloc>()),
      BlocProvider<PoinBloc>(
          create: (context) => Injector.container.resolve<PoinBloc>()),
      BlocProvider<PointHistoryBloc>(
          create: (context) => Injector.container.resolve<PointHistoryBloc>()),
      BlocProvider<GamesBloc>(
          create: (context) => Injector.container.resolve<GamesBloc>()),
      BlocProvider<OtpPageBloc>(
          create: (context) => Injector.container.resolve<OtpPageBloc>()),
      BlocProvider<LandingPageBloc>(
          create: (context) => Injector.container.resolve<LandingPageBloc>()),
      BlocProvider<ConsultationPageBloc>(
          create: (context) =>
              Injector.container.resolve<ConsultationPageBloc>()),
      BlocProvider<ChangePasswordBloc>(
          create: (context) =>
              Injector.container.resolve<ChangePasswordBloc>()),
      BlocProvider<ChatBloc>(
          create: (context) => Injector.container.resolve<ChatBloc>()),
      BlocProvider<ConsultationPageBloc>(
          create: (context) =>
              Injector.container.resolve<ConsultationPageBloc>()),
      BlocProvider<HospitalBloc>(
          create: (context) => Injector.container.resolve<HospitalBloc>()),
      BlocProvider<ChatPendingBloc>(
          create: (context) => Injector.container.resolve<ChatPendingBloc>()),
      BlocProvider<ProfilePageBloc>(
          create: (context) => Injector.container.resolve<ProfilePageBloc>()),
      BlocProvider<ForgotPasswordPageBloc>(
          create: (context) =>
              Injector.container.resolve<ForgotPasswordPageBloc>()),
      BlocProvider<PinCheckInBloc>(
          create: (context) => Injector.container.resolve<PinCheckInBloc>()),
      BlocProvider<DisclaimerPageBloc>(
          create: (context) =>
              Injector.container.resolve<DisclaimerPageBloc>()),
      BlocProvider<PatientSelectBloc>(
          create: (context) => Injector.container.resolve<PatientSelectBloc>()),
      BlocProvider<CommentBloc>(
          create: (context) => Injector.container.resolve<CommentBloc>()),
      BlocProvider<AudioBloc>(
          create: (context) => Injector.container.resolve<AudioBloc>()),
      BlocProvider<NewBornPageBloc>(
          create: (context) => Injector.container.resolve<NewBornPageBloc>()),
      BlocProvider<ChildListBloc>(
          create: (context) => Injector.container.resolve<ChildListBloc>()),
      BlocProvider<NotificationBloc>(
          create: (context) => Injector.container.resolve<NotificationBloc>()),
      BlocProvider<GrowthBloc>(
          create: (context) => Injector.container.resolve<GrowthBloc>()),
    ];

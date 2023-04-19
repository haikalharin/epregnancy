import 'package:PregnancyApp/pages/article_page/article_detail_page.dart';
import 'package:PregnancyApp/pages/audio_page/playlist_page/playlist_page.dart';
import 'package:PregnancyApp/pages/audio_page/playlist_page/playlist_page_musik.dart';
import 'package:PregnancyApp/pages/change_password_page/change_password_page.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/article_page/dashboard_article.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard_midwife.dart';
import 'package:PregnancyApp/pages/disclaimer_page/disclaimer_page.dart';
import 'package:PregnancyApp/pages/event_page/add_event_page.dart';
import 'package:PregnancyApp/pages/event_page/add_event_page_midwife.dart';
import 'package:PregnancyApp/pages/event_page/choose_type_event_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/location_select_page/location_select_page.dart';
import 'package:PregnancyApp/pages/nakes_page/dashboard_nakes_page.dart';
import 'package:PregnancyApp/pages/navbar_page/bottom_nav.dart';
import 'package:PregnancyApp/pages/new_born_page/questioner_new_born_page.dart';
import 'package:PregnancyApp/pages/onboarding_page/onboarding_page.dart';
import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/otp_page/verifikasi_page.dart';
import 'package:PregnancyApp/pages/poin_page/poin_activity_page.dart';
import 'package:PregnancyApp/pages/poin_page/poin_page.dart';
import 'package:PregnancyApp/pages/profile_page/profile_nakes_page/profile_nakes_page.dart';
import 'package:PregnancyApp/pages/signup_page/signup_page.dart';
import 'package:PregnancyApp/pages/survey_page/survey_page.dart';
import 'package:PregnancyApp/pages/survey_page/survey_page_baby.dart';
import 'package:PregnancyApp/pages/webview_page/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../common/constants/router_constants.dart';
import '../pages/audio_page/audio_main_page.dart';
import '../pages/audio_page/audio_player_page/audio_player_page.dart';
import '../pages/chat_page/chat_page.dart';
import '../pages/chat_page/chat_room.dart';
import '../pages/event_page/add_event_page_for_patient.dart';
import '../pages/forgot_password_page/forgot_password_page.dart';
import '../pages/forgot_password_page/new_password_page.dart';
import '../pages/games_page/games_page.dart';
import '../pages/landing_page/landing_page.dart';
import '../pages/login_page/login_page.dart';
import '../pages/profile_page/profile_user_page/profile_user_page.dart';
import '../pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import '../utils/remote_utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.signup:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case RouteName.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (_) => LoginPage(
                  tokenExpired: getTokenExpiredArgument(settings.arguments),
                  isFromRegister: getIsFromRegisterArgument(settings.arguments),
                ));
      case RouteName.homeScreen:
        return MaterialPageRoute(
            builder: (_) => HomePage(
                  userId: getDataValue(settings.arguments),
                ));
      case RouteName.surveyPage:
        return MaterialPageRoute(
            builder: (_) =>
                SurveyPage(isEdit: getDataValue(settings.arguments)));
      case RouteName.surveyPageBaby:
        return MaterialPageRoute(
            builder: (_) =>
                SurveyPageBaby(isEdit: getIsEdit(settings.arguments), editName: getEditName(settings.arguments), fromRegister: getFromRegister(settings.arguments),));
      case RouteName.articleDetailPage:
        return MaterialPageRoute(builder: (_) => ArticleDetailPage());
      case RouteName.chatPage:
        return MaterialPageRoute(
            builder: (_) => ChatPage(
                  userId: getDataValue(settings.arguments),
                ));
      case RouteName.navBar:
        return MaterialPageRoute(
            builder: (_) => NavbarPage(
                  role: getRoleArgument(settings.arguments),
                  initalIndex: getInitialIndex(settings.arguments),
                  userId: getUserId(settings.arguments),
                  isFromNotif: getIsFromNotif(settings.arguments)
                ));
      case RouteName.dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case RouteName.locationSelect:
        return MaterialPageRoute(builder: (_) => LocationSelectPage());
      case RouteName.dashboardMidwife:
        return MaterialPageRoute(builder: (_) => DashboardMidwife());
      case RouteName.dashboardArticle:
        return MaterialPageRoute(builder: (_) => DashboardArticle());
      case RouteName.chatRoom:
        return MaterialPageRoute(
            builder: (_) =>
                ChatRoom(arguments: getDataValue(settings.arguments)));
      case RouteName.landingPage:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case RouteName.otpPage:
        return MaterialPageRoute(
            builder: (_) => OtpPage(userName: getUserName(settings.arguments),
           from: getFrom(settings.arguments),));
      case RouteName.verifikasiPage:
        return MaterialPageRoute(
            builder: (_) =>
                VerifikasiPage(userId: getDataValue(settings.arguments)));
      case RouteName.dashboardNakesPage:
        return MaterialPageRoute(
            builder: (_) => DashBoardNakesPage(
                  userName: getName(settings.arguments),
                  imageUrl: getImageUrl(settings.arguments),
                  hospitalId: getHospitalId(settings.arguments),
                ));
      case RouteName.addEventPage:
        return MaterialPageRoute(
            builder: (_) => AddEventPage(consulType: getDataValue(settings.arguments)));
      case RouteName.addEventPageMidwife:
        return MaterialPageRoute(
            builder: (_) => AddEventPageMidwife(consulType: getDataValue(settings.arguments)));
      case RouteName.addEventPageForPatient:
        return MaterialPageRoute(
            builder: (_) => AddEventPageForPatient(consulType: getDataValue(settings.arguments)));
      case RouteName.chooseTypeEvent:
        return MaterialPageRoute(builder: (_) => ChooseTypeEventPage(role: getDataValue(settings.arguments),));
        return MaterialPageRoute(
            builder: (_) =>
                VerifikasiPage(userId: getDataValue(settings.arguments)));
      case RouteName.profileNakesPage:
        return MaterialPageRoute(
            builder: (_) => ProfileNakesPage(
                  name: getName(settings.arguments),
                  imageUrl: getImageUrl(settings.arguments),
                ));
      case RouteName.profileUserPage:
        return MaterialPageRoute(builder: (_) => ProfileUserPage());
      case RouteName.poinPage:
        return MaterialPageRoute(
            builder: (_) => PoinPage(point: getDataValue(settings.arguments)));
      case RouteName.poinActivityPage:
        return MaterialPageRoute(
            builder: (_) => PoinActivityPage(
                  point: getDataValue(settings.arguments),
                ));
      case RouteName.gamesPage:
        return MaterialPageRoute(builder: (_) => GamesPage());
      case RouteName.webViewPage:
        return MaterialPageRoute(
            builder: (_) => WebViewPage(
                url: getGameUrl(settings.arguments),
                title: getGameName(settings.arguments)));

      case RouteName.signUpQuestionnairePage:
        return MaterialPageRoute(
            builder: (_) => const SignUpQuestionnairePage());
      case RouteName.audio:
        return MaterialPageRoute(
            builder: (_) => const AudioMainPage());
      case RouteName.playlist:
        return MaterialPageRoute(
            builder: (_) => const PlaylistPage());
      case RouteName.playlistMusic:
        return MaterialPageRoute(
            builder: (_) => const PlaylistPageMusic());
      case RouteName.audioPlayer:
        return MaterialPageRoute(
            builder: (_) => const AudioPlayerPage());
      case RouteName.changePasswordPage:
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());
      case RouteName.newPasswordPage:
        return MaterialPageRoute(builder: (_) =>  NewPasswordPage( otp: getOtp(settings.arguments)));
      case RouteName.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case RouteName.disclaimer:
        return MaterialPageRoute(
            builder: (_) => DisclaimerPage(
                  userId: getUserId(settings.arguments),
                  isPatient: getIsPatient(settings.arguments),
                  from: getFrom(settings.arguments),
                ));
      case RouteName.questionerNewBorn:
        return MaterialPageRoute(
            builder: (_) =>
                QuestionerNewBornPage(isEdit: getIsEdit(settings.arguments),babyModel:getDataBaby(settings.arguments) ,));

      // case RouteName.order:
      //   return MaterialPageRoute(builder: (_) => OrderPage());
      // case RouteName.movieDetailScreen:
      //   final MovieDetailArguments arguments = settings.arguments;
      //   return MaterialPageRoute(
      //     builder: (_) => MovieDetailScreen(
      //       movieId: arguments.movieId,
      //       coverPath: arguments.coverPath,
      //       title: arguments.title,
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}

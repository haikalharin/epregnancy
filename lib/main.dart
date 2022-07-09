import 'package:PregnancyApp/pages/article_page/bloc/article_bloc.dart';
import 'package:PregnancyApp/pages/email_verification_page/email_verification_page.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/landing_page/landing_page.dart';
import 'package:PregnancyApp/pages/navbar_page/bottom_nav.dart';
import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/signup_page/bloc/signup_bloc.dart';
import 'package:PregnancyApp/pages/signup_page/signup_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:PregnancyApp/pages/survey_page/bloc/survey_page_bloc.dart';
import 'package:PregnancyApp/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/configurations/configurations.dart';
import 'common/injector/injector.dart';
import 'common/injector/injector_config.dart';
import 'env.dart' as config;
import 'pages/login_page/bloc/login_bloc.dart';
import 'pages/login_page/login_page.dart';
import 'utils/simple_bloc_observer.dart';

// void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  InjectorConfig.setup();
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc.observer = SimpleBlocObserver();
  await Configurations().setConfigurationValues(config.environment);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: _getProviders(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Epregnancy App',
          home: SignUpPage(),
          onGenerateRoute: Routes.generateRoute,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ));
  }

  List<BlocProvider> _getProviders() => [
        BlocProvider<LoginExampleBloc>(
            create: (context) =>
                Injector.container.resolve<LoginExampleBloc>()),
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
      ];
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

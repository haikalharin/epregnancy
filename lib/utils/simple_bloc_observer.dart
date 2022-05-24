import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc? bloc, Object? event) {
    print('bloc on event ${bloc.runtimeType} $event');
    super.onEvent(bloc!, event);
  }

  // @override
  // void onError(Bloc bloc, Object error, StackTrace stackTrace) {
  //   print('bloc on error${bloc.runtimeType} $error');
  //   super.onError(bloc, error, stackTrace);
  // }

  // @override
  // void onError(Cubit? cubit, Object? error, StackTrace? stackTrace) {
  //   // TODO: implement onError
  //   super.onError(cubit!, error!, stackTrace!);
  // }

  // @override
  // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
  //   print('bloc on error${cubit.runtimeType} $error');
  //   super.onError(cubit, error, stackTrace);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('bloc on transition $transition');
    super.onTransition(bloc, transition);
  }
}

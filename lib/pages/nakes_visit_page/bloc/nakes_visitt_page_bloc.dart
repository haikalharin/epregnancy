import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nakes_visitt_page_event.dart';
part 'nakes_visitt_page_state.dart';

class NakesVisittPageBloc extends Bloc<NakesVisittPageEvent, NakesVisittPageState> {
  NakesVisittPageBloc() : super(NakesVisittPageInitial()) {
    on<NakesVisittPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

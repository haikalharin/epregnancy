import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/validators/mandatory_field_validator.dart';
import '../../../common/validators/phone_validator.dart';
import '../../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../example_dashboard_chat_page/login_example_page/model/password.dart';

part 'event_page_event.dart';
part 'event_page_state.dart';

class EventPageBloc extends Bloc<EventPageEvent, EventPageState> {
  EventPageBloc() : super(EventPageInitial()) {
    on<EventPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

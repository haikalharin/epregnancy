import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'otp_page_event.dart';
part 'otp_page_state.dart';

class OtpPageBloc extends Bloc<OtpPageEvent, OtpPageState> {
  OtpPageBloc() : super(OtpPageInitial()) {
    on<OtpPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

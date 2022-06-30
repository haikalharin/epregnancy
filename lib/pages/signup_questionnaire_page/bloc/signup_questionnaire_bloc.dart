import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../../common/validators/phone_validator.dart';
import '../../login_page/model/email_address.dart';

part 'signup_questionnaire_event.dart';
part 'signup_questionnaire_state.dart';

class SignUpQuestionnaireBloc extends Bloc<SignUpQuestionnaireEvent, SignUpQuestionnaireState> {
  SignUpQuestionnaireBloc(this.userRepository) : super(SignUpQuestionnaireInitial());

  final UserRepository userRepository;

}

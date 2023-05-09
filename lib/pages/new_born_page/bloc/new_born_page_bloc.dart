import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/signup_quest_request.dart';
import 'package:PregnancyApp/data/repository/child_repository/child_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/new_born_error_exception.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../data/model/baby_model/new_baby_model.dart' as newBaby;
import '../../../data/model/baby_model_api/baby_Model_api.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../child_list_page/bloc/child_list_bloc.dart';
import '../../home_page/bloc/home_page_bloc.dart';

part 'new_born_page_event.dart';

part 'new_born_page_state.dart';

class NewBornPageBloc extends Bloc<NewBornPageEvent, NewBornPageState> {
  NewBornPageBloc(this.userRepository, this.childRepository) : super(NewBornPageInitial());

  final UserRepository userRepository;
  final ChildRepository childRepository;

  @override
  Stream<NewBornPageState> mapEventToState(NewBornPageEvent event) async* {
    if (event is NewBornAddDataEvent) {
      yield* _mapNewBornAddDataToState(event, state);
    } else if (event is NewBornAddDataBabyEvent) {
      yield* _mapNewBornAddDataBabyToState(event, state);
    } else if (event is NewBornDateChanged) {
      yield _mapNewBornDateChangedToState(event, state);
    } else if (event is NewBornBabysNameChanged) {
      yield _mapNewBornBabysNameChangedToState(event, state);
    } else if (event is NewBornPageChanged) {
      yield _mapNewBornPageChangedToState(event, state);
    } else if (event is NewBornChoice) {
      yield _mapNewBornNewBornChoiceToState(event, state);
    } else if (event is NewBornInitEvent) {
      yield* _mapNewBornInitEventToState(event, state);
    } else if (event is NewBornDisposeEvent) {
      yield _mapNewBornDisposeEventToState(event, state);
    } else if (event is NewBornAddChildEvent) {
      yield* _mapNewBordAddChildEvent(event, state);
    } else if (event is LostBabyEvent) {
      yield* _lostBabyEvent(event, state);
    } else if (event is DeleteBabyEvent) {
      yield* _deleteBabyEvent(event, state);
    } else if(event is UpdateChildEvent){
      yield* _mapUpdateChildEvent(event, state);
    } else if (event is DeleteChildEvent) {
      yield* _deleteChildEvent(event, state);
    }
  }

  Stream<NewBornPageState> _mapNewBordAddChildEvent(NewBornAddChildEvent event, NewBornPageState state) async* {
    try{
      yield state.copyWith(type: "adding-child-loading", submitStatus: FormzStatus.submissionInProgress);
      if(event.babyId != "") {
        ResponseModel updateBabyResponse = await childRepository.updateBabyStatus(event.babyId!, event.status!);

        if(updateBabyResponse.code == 200){
          ResponseModel addChildResponse = await childRepository.addChild(event.name, event.dob, event.gender);
          if(addChildResponse.code == 200) {
            Injector.resolve<HomePageBloc>().add(const ResetBaby());
            Injector.resolve<HomePageBloc>().add(const HomeFetchBabyChildsEvent());
            yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: "adding-child-success");
          } else {
            print("add child code != 200");
            yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "adding-child-failed");
          }
        } else {
          print("update baby code != 200");
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "adding-child-failed");
        }
      } else {
        ResponseModel addChildResponse = await childRepository.addChild(event.name, event.dob, event.gender);
        if(addChildResponse.code == 200) {
          yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: "adding-child-success");
        } else {
          print("add child code != 200");
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "adding-child-failed");
        }
      }
    }catch(e){
      print("_mapNewBordAddChildEventError : ${e.toString()}");
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "adding-child-failed");
    }
  }

  Stream<NewBornPageState> _mapUpdateChildEvent(UpdateChildEvent event, NewBornPageState state) async* {
    try{
      yield state.copyWith(type: "update-child-loading", submitStatus: FormzStatus.submissionInProgress);
      ResponseModel addChildResponse = await childRepository.updateChild(event.babyId, event.name, event.dob, event.gender);
      if(addChildResponse.code == 200) {
        print('success update child');
        Injector.resolve<HomePageBloc>().add(const HomeFetchBabyChildsEvent());
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: "update-child-success");
      } else {
        print('failed update child');
        print("add child code != 200");
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "update-child-failed");
      }
    }catch(e){
      print("_mapUpdateChildEventError : ${e.toString()}");
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "update-child-failed");
    }
  }

  Stream<NewBornPageState> _lostBabyEvent(LostBabyEvent event, NewBornPageState state) async* {
    try{
      state.copyWith(type: "lost-baby-loading", submitStatus: FormzStatus.submissionInProgress);
      ResponseModel updateBabyStatusResponse = await childRepository.updateBabyStatus(event.babyId!, "KEHILANGAN");
      if(updateBabyStatusResponse.code == 200){
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: "lost-baby-success");

      } else {
        print("Terjadi Kesalahan!");
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "lost-baby-failed");
      }
    }catch(e){
      print("update baby lost error : ${e.toString()}");
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "lost-baby-failed");
    }
  }

  Stream<NewBornPageState> _deleteBabyEvent(DeleteBabyEvent event, NewBornPageState state) async* {
    try{
      state.copyWith(type: "delete-baby-loading", submitStatus: FormzStatus.submissionInProgress);
      ResponseModel updateBabyStatusResponse = await childRepository.deleteBaby(event.babyId!);
      if(updateBabyStatusResponse.code == 200){
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: "delete-baby-success");

      } else {
        print("Somethings went wrong!");
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "delete-baby-failed");
      }
    }catch(e){
      print("update baby delete error : ${e.toString()}");
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "delete-baby-failed");
    }
  }

  Stream<NewBornPageState> _deleteChildEvent(DeleteChildEvent event, NewBornPageState state) async* {
    try{
      state.copyWith(type: "delete-child-loading", submitStatus: FormzStatus.submissionInProgress);
      ResponseModel updateBabyStatusResponse = await childRepository.deleteChild(event.id!);
      if(updateBabyStatusResponse.code == 200){
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: "delete-child-success");
        Injector.resolve<ChildListBloc>().add(const FetchChildListEvent());
      } else {
        print("Somethings went wrong!");
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "delete-child-failed");
      }
    }catch(e){
      print("update child delete error : ${e.toString()}");
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, type: "delete-child-failed");
    }
  }

  NewBornPageState _mapNewBornDisposeEventToState(
    NewBornDisposeEvent event,
    NewBornPageState state,
  ) {
    return NewBornPageState();
  }

  Stream<NewBornPageState> _mapNewBornInitEventToState(
      NewBornInitEvent event, NewBornPageState state) async* {
    try {
      var user = await AppSharedPreference.getUser();
      newBaby.NewBabyModel myBaby = const newBaby.NewBabyModel();
      var choice = 0;
      ResponseModel response = await userRepository.getBaby(user);
      myBaby =
          response.data != null ? response.data : const newBaby.NewBabyModel();
      if (event.isUpdate && response.data != null) {
        // user = await AppSharedPreference.getUser();

        if (user.isPregnant == true) {
          choice = 1;
        } else if (user.isPlanningPregnancy == true) {
          choice = 2;
        } else if (user.isHaveBaby == true) {
          choice = 3;
        }
      }
      if (response.code == 200) {
        if (event.isUpdate && response.data != null) {
          yield NewBornPageState(
              submitStatus: FormzStatus.submissionSuccess,
              type: 'init-data-NewBorn',
              user: user,
              page: 1,
              date: MandatoryFieldValidator.dirty(
                  myBaby.baby!.lastMenstruationDate!),
              dataBaby:
                  myBaby.baby != null ? myBaby : const newBaby.NewBabyModel(),
              choice: choice);
        } else {
          yield NewBornPageState(
              submitStatus: FormzStatus.submissionSuccess,
              type: 'init-data-NewBorn',
              user: user,
              page: 1,
              choice: choice);
        }
      } else {
        yield NewBornPageState(
            submitStatus: FormzStatus.submissionSuccess,
            type: 'init-data-NewBorn',
            user: user,
            page: 1,
            choice: choice);
      }
    } on NewBornErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

  NewBornPageState _mapNewBornNewBornChoiceToState(
    NewBornChoice event,
    NewBornPageState state,
  ) {
    return state.copyWith(
      choice: event.choice,
    );
  }

  NewBornPageState _mapNewBornPageChangedToState(
    NewBornPageChanged event,
    NewBornPageState state,
  ) {
    return state.copyWith(
      page: event.page,
    );
  }

  NewBornPageState _mapNewBornBabysNameChangedToState(
    NewBornBabysNameChanged event,
    NewBornPageState state,
  ) {
    final name = MandatoryFieldValidator.dirty(event.name);
    return state.copyWith(
      name: name,
    );
  }

  NewBornPageState _mapNewBornDateChangedToState(
    NewBornDateChanged event,
    NewBornPageState state,
  ) {
    final date = MandatoryFieldValidator.dirty(event.date);
    return state.copyWith(
      date: date,
    );
  }

  Stream<NewBornPageState> _mapNewBornAddDataToState(
    NewBornAddDataEvent event,
    NewBornPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      // UserModel user = await AppSharedPreference.getUserRegister();
      UserModel user = await AppSharedPreference.getUser();
      ResponseModel responseBaby = await userRepository.getBaby(user);
      newBaby.NewBabyModel myBaby =
          responseBaby.data ?? const newBaby.NewBabyModel();

      if (event.isUpdate && myBaby != null) {
        user = await AppSharedPreference.getUser();
      }
      ResponseModel response = await userRepository.updateQuestioner(
          SignupQuestRequest(
              id: user.id ?? state.user?.id,
              isPregnant: event.isPregnant,
              isPlanningPregnancy: event.isPlanningPregnancy,
              isHaveBaby: event.isHaveBaby));

      if (response.code == 200) {
        UserModel userModel = response.data;
        // await AppSharedPreference.setUserRegister(response.data);
        if (event.isUpdate) {
          await AppSharedPreference.setUser(response.data);
        }
        // await AppSharedPreference.setString(AppSharedPreference.token,userModel.token??'');
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, type: 'submit');
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on NewBornErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

//

  Stream<NewBornPageState> _mapNewBornAddDataBabyToState(
    NewBornAddDataBabyEvent event,
    NewBornPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModel user = event.isUpdate == false
          ? await AppSharedPreference.getUser()
          : await AppSharedPreference.getUser();
      ResponseModel response = ResponseModel.dataEmpty();
      if (state.dataBaby?.baby != null) {
        response = await userRepository.updateQuestionerBaby(BabyModelApi(
            id: state.dataBaby?.baby?.id,
            name: state.name.value,
            lastMenstruationDate: state.date.value));
      } else {
        String? userId = user.id;
        // if (user.id != null) {
        //   userId = state.user?.id;
        // } else {
        //   userId = state.user?.id;
        // }

        response = await userRepository.saveQuestionerBaby(BabyModelApi(
            userId: userId,
            name: state.name.value,
            lastMenstruationDate: state.date.value));
      }

      if (response.code == 200) {
        if (event.isUpdate) {
          await AppSharedPreference.setBabyDataNew(newBaby.NewBabyModel(
              baby: newBaby.Baby(
                  userId: user.id,
                  name: state.name.value,
                  lastMenstruationDate: state.date.value)));
        }
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, type: 'submitBaby');
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on NewBornErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
//

}

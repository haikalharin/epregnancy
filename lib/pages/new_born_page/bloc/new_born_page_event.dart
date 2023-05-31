part of 'new_born_page_bloc.dart';

@immutable
abstract class NewBornPageEvent extends Equatable{
   const NewBornPageEvent();

  @override
  List<Object> get props => [];
}

class NewBornAddDataEvent extends NewBornPageEvent {
  const NewBornAddDataEvent(this.isPregnant, this.isPlanningPregnancy, this.isHaveBaby, this.isUpdate);
final bool isUpdate;
  final bool isPregnant;
  final bool isPlanningPregnancy;
  final bool isHaveBaby;


  @override
  List<Object> get props => [];
}

class UpdateChildEvent extends NewBornPageEvent {
  const UpdateChildEvent({this.name, required this.dob, required this.gender, this.babyId});

  final String? name;
  final String dob;
  final String gender;
  final String? babyId;

  @override
  List<Object> get props => [];
}

class NewBornAddDataBabyEvent extends NewBornPageEvent {
   NewBornAddDataBabyEvent({this.isUpdate =false});
   bool isUpdate;



  @override
  List<Object> get props => [];
}

class NewBornPageChanged extends NewBornPageEvent {
  const NewBornPageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

class NewBornDateChanged extends NewBornPageEvent {
  const NewBornDateChanged(this.date);

  final String date;

  @override
  List<Object> get props => [date];
}

class NewBornBabysNameChanged extends NewBornPageEvent {
  const NewBornBabysNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class NewBornInitEvent extends NewBornPageEvent {
  const NewBornInitEvent({this.isUpdate = false});
  final bool isUpdate;



  @override
  List<Object> get props => [];
}

class NewBornDisposeEvent extends NewBornPageEvent {
  const NewBornDisposeEvent();



  @override
  List<Object> get props => [];
}

class NewBornUpdateDataBabyEvent extends NewBornPageEvent {
  const NewBornUpdateDataBabyEvent(this.babyModel, this.status);

  final newBaby.NewBabyModel babyModel;
  final String status;



  @override
  List<Object> get props => [];
}

class NewBornDeleteDataBabyEvent extends NewBornPageEvent {
  const NewBornDeleteDataBabyEvent(this.babyModel);

  final newBaby.NewBabyModel babyModel;



  @override
  List<Object> get props => [];
}

class NewBornAddChildEvent extends NewBornPageEvent {
  const NewBornAddChildEvent({this.name, required this.dob, required this.gender, this.status, this.babyId});

  final String? name;
  final String dob;
  final String gender;
  final String? babyId;
  final String? status;

  @override
  List<Object> get props => [];
}

class NewBornChoice extends NewBornPageEvent {
  const NewBornChoice(this.choice);

  final int choice;


  @override
  List<Object> get props => [];
}

class LostBabyEvent extends NewBornPageEvent {
  const LostBabyEvent(this.babyId);

  final String? babyId;


  @override
  List<Object> get props => [];
}

class DeleteBabyEvent extends NewBornPageEvent {
  const DeleteBabyEvent(this.babyId);

  final String? babyId;


  @override
  List<Object> get props => [];
}

class DeleteChildEvent extends NewBornPageEvent {
  const DeleteChildEvent(this.id);

  final String? id;


  @override
  List<Object> get props => [];
}




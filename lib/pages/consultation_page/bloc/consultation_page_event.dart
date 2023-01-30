part of 'consultation_page_bloc.dart';

@immutable
abstract class ConsultationPageEvent extends Equatable {
  const ConsultationPageEvent();

  @override
  List<Object> get props => [];
}

class ConsultationFetchEvent extends ConsultationPageEvent {
  const ConsultationFetchEvent();

  @override
  List<Object> get props => [];
}

class ConsultationDeletePostEvent extends ConsultationPageEvent {
  const ConsultationDeletePostEvent(this.id);
  final String? id;

  @override
  List<Object> get props => [];
}

class ConsultationSubmittedEvent extends ConsultationPageEvent {
  const ConsultationSubmittedEvent();

  @override
  List<Object> get props => [];
}

class ConsultationDescriptionChanged extends ConsultationPageEvent {
  const ConsultationDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class ConsultationImageChanged extends ConsultationPageEvent {
  const ConsultationImageChanged(this.image);

  final String image;

  @override
  List<Object> get props => [image];
}

class ConsultationLikeSubmitted extends ConsultationPageEvent {
  const ConsultationLikeSubmitted(this.id, this.isLike);

  final String id;
  final bool isLike;

  @override
  List<Object> get props => [id];
}

class ConsultationDisposeEvent extends ConsultationPageEvent {
  const ConsultationDisposeEvent();
}

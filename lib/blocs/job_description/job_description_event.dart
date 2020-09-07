part of 'job_description_bloc.dart';

@immutable
abstract class JobDescriptionEvent {}

class GetJobDescriptionEvent extends JobDescriptionEvent {
  final String id;

  GetJobDescriptionEvent(this.id);
}

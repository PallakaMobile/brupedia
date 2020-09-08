part of 'job_knowledge_bloc.dart';

@immutable
abstract class JobKnowledgeEvent {}

class GetJobKnowledgeEvent extends JobKnowledgeEvent {
  final Map<String, String> params;

  GetJobKnowledgeEvent(this.params);
}

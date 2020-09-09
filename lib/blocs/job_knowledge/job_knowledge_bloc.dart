import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/data/repositories/repositories.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'job_knowledge_event.dart';

class JobKnowledgeBloc
    extends Bloc<JobKnowledgeEvent, Resources<MediaResponse>> {
  JobKnowledgeBloc() : super(Resources.loading());

  @override
  Stream<Resources<MediaResponse>> mapEventToState(
      JobKnowledgeEvent event) async* {
    var _jobKnowledgeRepo = sl<JobKnowledgeRepository>();
    if (event is GetJobKnowledgeEvent) {
      yield Resources.loading();
      yield await _jobKnowledgeRepo.jobKnowledge(event.params);
    }
  }
}

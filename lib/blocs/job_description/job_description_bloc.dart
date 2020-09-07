import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/job_description_response.dart';
import 'package:brupedia/data/repositories/job_description_repository.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'job_description_event.dart';

class JobDescriptionBloc
    extends Bloc<JobDescriptionEvent, Resources<JobDescriptionResponse>> {
  JobDescriptionBloc() : super(Resources.loading());

  @override
  Stream<Resources<JobDescriptionResponse>> mapEventToState(
      JobDescriptionEvent event) async* {
    var _jobDescriptionRepo = sl<JobDescriptionRepository>();
    if (event is GetJobDescriptionEvent) {
      yield Resources.loading();
      yield await _jobDescriptionRepo.jobDescription(event.id);
    }
  }
}

part of 'sop_bloc.dart';

@immutable
abstract class SOPEvent {}

class GetSOPEvent extends SOPEvent {
  final Map<String, String> params;
  final bool isFirstPage;

  GetSOPEvent(this.params, this.isFirstPage);
}

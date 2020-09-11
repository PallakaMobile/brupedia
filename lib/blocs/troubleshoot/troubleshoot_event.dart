part of 'troubleshoot_bloc.dart';

@immutable
abstract class TroubleshootEvent {}

class GetTroubleshootEvent extends TroubleshootEvent {
  final Map<String, String> params;

  GetTroubleshootEvent(this.params);
}

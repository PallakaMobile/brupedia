part of 'list_jabatan_bloc.dart';

@immutable
abstract class ListJabatanEvent {}

class GetListJabatanEvent extends ListJabatanEvent {
  final Map<String, String> params;

  GetListJabatanEvent(this.params);
}

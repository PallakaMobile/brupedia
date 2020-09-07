import 'diagnostic.dart';

class ListJabatanResponse {
  Diagnostic diagnostic;
  List<Data> data;

  ListJabatanResponse({this.diagnostic, this.data});

  ListJabatanResponse.fromJson(Map<String, dynamic> json) {
    diagnostic = json['diagnostic'] != null
        ? new Diagnostic.fromJson(json['diagnostic'])
        : null;
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diagnostic != null) {
      data['diagnostic'] = this.diagnostic.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String namaJabatan;

  Data({this.id, this.namaJabatan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaJabatan = json['nama_jabatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_jabatan'] = this.namaJabatan;
    return data;
  }
}

import 'package:brupedia/data/models/responses/diagnostic.dart';

class ListTroubleshoot {
  Diagnostic diagnostic;
  List<Data> data;

  ListTroubleshoot({this.diagnostic, this.data});

  ListTroubleshoot.fromJson(Map<String, dynamic> json) {
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
  int bidangId;
  String judul;
  String deskripsi;
  String createdAt;
  List<DataTindakan> dataTindakan;
  String summary;
  bool isVisible = false;

  Data(
      {this.id,
      this.bidangId,
      this.judul,
      this.deskripsi,
      this.createdAt,
      this.dataTindakan,
      this.summary,
      this.isVisible = false});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bidangId = json['bidang_id'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    if (json['data_tindakan'] != null) {
      dataTindakan = new List<DataTindakan>();
      json['data_tindakan'].forEach((v) {
        dataTindakan.add(new DataTindakan.fromJson(v));
      });
    }
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bidang_id'] = this.bidangId;
    data['judul'] = this.judul;
    data['deskripsi'] = this.deskripsi;
    data['created_at'] = this.createdAt;
    if (this.dataTindakan != null) {
      data['data_tindakan'] = this.dataTindakan.map((v) => v.toJson()).toList();
    }
    data['summary'] = this.summary;
    return data;
  }
}

class DataTindakan {
  int id;
  int bidangId;
  String judul;
  String deskripsi;
  Null tindakan;
  int status;
  String tglTindakan;
  String summary;

  DataTindakan(
      {this.id,
      this.bidangId,
      this.judul,
      this.deskripsi,
      this.tindakan,
      this.status,
      this.tglTindakan,
      this.summary});

  DataTindakan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bidangId = json['bidang_id'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    tindakan = json['tindakan'];
    status = json['status'];
    tglTindakan = json['tgl_tindakan'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bidang_id'] = this.bidangId;
    data['judul'] = this.judul;
    data['deskripsi'] = this.deskripsi;
    data['tindakan'] = this.tindakan;
    data['status'] = this.status;
    data['tgl_tindakan'] = this.tglTindakan;
    data['summary'] = this.summary;
    return data;
  }
}

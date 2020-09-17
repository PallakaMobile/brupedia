import 'package:brupedia/data/models/responses/diagnostic.dart';

class MediaResponse {
  Diagnostic diagnostic;
  int currentPage;
  int lastPage;
  List<Data> data;

  MediaResponse({this.diagnostic, this.currentPage, this.lastPage, this.data});

  MediaResponse.fromJson(Map<String, dynamic> json) {
    diagnostic = json['diagnostic'] != null
        ? new Diagnostic.fromJson(json['diagnostic'])
        : null;
    currentPage = json['current_page'];
    lastPage = json['last_page'];
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
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int bidangId;
  String nama;
  String file;
  String link;
  String createdAt;
  String updatedAt;
  String fileSize;
  String type;

  Data(
      {this.id,
      this.bidangId,
      this.nama,
      this.file,
      this.link,
      this.createdAt,
      this.updatedAt,
      this.fileSize,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bidangId = json['bidang_id'];
    nama = json['nama'];
    file = json['file'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fileSize = json['file_size'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bidang_id'] = this.bidangId;
    data['nama'] = this.nama;
    data['file'] = this.file;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['file_size'] = this.fileSize;
    data['type'] = this.type;
    return data;
  }
}

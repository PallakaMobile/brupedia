import 'package:brupedia/data/models/responses/diagnostic.dart';

class MediaResponse {
  Diagnostic diagnostic;
  List<Data> data;

  MediaResponse({this.diagnostic, this.data});

  MediaResponse.fromJson(Map<String, dynamic> json) {
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
  String nama ;
  String file;
  String createdAt;
  String updatedAt;
  int jabatanId;
  String link;
  String type;
  String fileSize;

  Data(
      {this.id,
      this.nama,
      this.file,
      this.createdAt,
      this.updatedAt,
      this.jabatanId,
      this.link,
      this.type,
      this.fileSize});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jabatanId = json['jabatan_id'];
    link = json['link'];
    type = json['type'];
    fileSize = json['file_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['file'] = this.file;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['jabatan_id'] = this.jabatanId;
    data['link'] = this.link;
    data['type'] = this.type;
    data['file_size'] = this.fileSize;
    return data;
  }
}

import 'package:brupedia/data/models/responses/diagnostic.dart';

class JobKnowledgeResponse {
  Diagnostic diagnostic;
  List<Data> data;

  JobKnowledgeResponse({this.diagnostic, this.data});

  JobKnowledgeResponse.fromJson(Map<String, dynamic> json) {
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
  String url;
  String type;
  String fileSize;

  Data(
      {this.id,
      this.nama,
      this.file,
      this.createdAt,
      this.updatedAt,
      this.jabatanId,
      this.url,
      this.type,
      this.fileSize});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jabatanId = json['jabatan_id'];
    url = json['url'];
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
    data['url'] = this.url;
    data['type'] = this.type;
    data['file_size'] = this.fileSize;
    return data;
  }
}

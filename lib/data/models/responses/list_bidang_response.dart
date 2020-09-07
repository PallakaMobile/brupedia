import 'diagnostic.dart';

class ListBidangResponse {
  Diagnostic diagnostic;
  List<Data> data;

  ListBidangResponse({this.diagnostic, this.data});

  ListBidangResponse.fromJson(Map<String, dynamic> json) {
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
  String kodeBidang;
  String namaBidang;
  int parentId;
  int satuanKerjaId;
  List<Childs> childs;

  Data(
      {this.id,
      this.kodeBidang,
      this.namaBidang,
      this.parentId,
      this.satuanKerjaId,
      this.childs});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodeBidang = json['kode_bidang'];
    namaBidang = json['nama_bidang'];
    parentId = json['parent_id'];
    satuanKerjaId = json['satuan_kerja_id'];
    if (json['childs'] != null) {
      childs = new List<Childs>();
      json['childs'].forEach((v) {
        childs.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_bidang'] = this.kodeBidang;
    data['nama_bidang'] = this.namaBidang;
    data['parent_id'] = this.parentId;
    data['satuan_kerja_id'] = this.satuanKerjaId;
    if (this.childs != null) {
      data['childs'] = this.childs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childs {
  int id;
  String kodeBidang;
  String namaBidang;
  int parentId;
  int satuanKerjaId;

  Childs(
      {this.id,
      this.kodeBidang,
      this.namaBidang,
      this.parentId,
      this.satuanKerjaId});

  Childs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodeBidang = json['kode_bidang'];
    namaBidang = json['nama_bidang'];
    parentId = json['parent_id'];
    satuanKerjaId = json['satuan_kerja_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_bidang'] = this.kodeBidang;
    data['nama_bidang'] = this.namaBidang;
    data['parent_id'] = this.parentId;
    data['satuan_kerja_id'] = this.satuanKerjaId;
    return data;
  }
}

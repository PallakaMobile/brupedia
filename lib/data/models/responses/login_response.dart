import 'diagnostic.dart';

class LoginResponse {
  Diagnostic diagnostic;
  Data data;

  LoginResponse({this.diagnostic, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    diagnostic = json['diagnostic'] != null
        ? new Diagnostic.fromJson(json['diagnostic'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diagnostic != null) {
      data['diagnostic'] = this.diagnostic.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;
  User user;

  Data(
      {this.tokenType,
      this.expiresIn,
      this.accessToken,
      this.refreshToken,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  String createdAt;
  String updatedAt;
  int role;
  int satuanKerjaId;
  Profile profile;
  String roleName;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.role,
      this.satuanKerjaId,
      this.profile,
      this.roleName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    satuanKerjaId = json['satuan_kerja_id'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role'] = this.role;
    data['satuan_kerja_id'] = this.satuanKerjaId;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['role_name'] = this.roleName;
    return data;
  }
}

class Profile {
  String fullName;
  String jabatan;
  String bidang;
  String avatar;

  Profile({this.fullName, this.jabatan, this.bidang, this.avatar});

  Profile.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    jabatan = json['jabatan'];
    bidang = json['bidang'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['jabatan'] = this.jabatan;
    data['bidang'] = this.bidang;
    data['avatar'] = this.avatar;
    return data;
  }
}

class SplashResponse {
  final bool error;
  final String? messageUz;
  final String? messageEn;
  final String? messageRu;
  final Data? data;

  SplashResponse({
    required this.error,
    this.messageUz,
    this.messageEn,
    this.messageRu,
    this.data,
  });

  factory SplashResponse.fromJson(Map<String, dynamic> json) {
    return SplashResponse(
      error: json['error'] ?? false,
      messageUz: json['message']?['uz'],
      messageEn: json['message']?['en'],
      messageRu: json['message']?['ru'],
      data: json['data'] != null && json['data'] is Map<String, dynamic>
          ? Data.fromJson(json['data'])
          : null,
    );
  }
}

class Data {
  final String userStatus;
  final String userAdmin;
  final String userCompanyId;
  final Company? company;

  Data({
    required this.userStatus,
    required this.userAdmin,
    required this.userCompanyId,
    this.company,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userStatus: json['user_status'] ?? '',
      userAdmin: json['user_admin'] ?? '',
      userCompanyId: json['user_company_id'] ?? '',
      company: json['company'] != null && json['company'] is Map<String, dynamic>
          ? Company.fromJson(json['company'])
          : null,
    );
  }
}

class Company {
  final String id;
  final String name;
  final String money;
  final String srok;
  final String status;

  Company({
    required this.id,
    required this.name,
    required this.money,
    required this.srok,
    required this.status,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] ?? '',
      name: json['tbl_company_name'] ?? '',
      money: json['tbl_company_money'] ?? '',
      srok: json['tbl_company_srok'] ?? '',
      status: json['tbl_company_status'] ?? '',
    );
  }
}

import 'package:get/get.dart';

class PaginationParameters {
  String? accessToken;
  String? tenantId;
  String? permissionId;
  String? groupId;
  String? clientId;
  late bool isTenantRole;
  int? page;
  int? limit;
  String? search;
  RxMap? filters;

  PaginationParameters({
    this.accessToken,
    this.tenantId,
    this.permissionId,
    this.groupId,
    this.clientId,
    this.isTenantRole = false,
    this.page,
    this.limit,
    this.search,
    this.filters,
  });

  PaginationParameters.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tenantId = json['tenantId'];
    groupId = json['groupId'];
    clientId = json['clientId'];
    isTenantRole = json['isTenantRole'];
    page = json['page'];
    limit = json['limit'];
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['tenantId'] = tenantId;
    data['groupId'] = groupId;
    data['clientId'] = clientId;
    data['isTenantRole'] = isTenantRole;
    data['page'] = page;
    data['limit'] = limit;
    data['search'] = search;
    return data;
  }
}

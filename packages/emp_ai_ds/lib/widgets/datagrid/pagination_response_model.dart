class PaginationResponse {
  dynamic items;
  int? count;
  int? page;
  int? limit;

  PaginationResponse({this.items, this.count, this.page, this.limit});

  PaginationResponse.fromJson(Map<String, dynamic> json) {
    items = json['items'] ?? json;
    count = json['count'] ?? json.values.length;
    page = json['page'] ?? 1;
    limit = json['limit'] ?? 999;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items;
    }
    data['count'] = count;
    data['page'] = page;
    data['limit'] = limit;
    return data;
  }
}

class Items {
  String? id;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  dynamic deletedAt;
  dynamic deletedBy;
  String? name;
  String? description;
  String? fileName;
  String? fileSize;
  String? filePath;
  String? fileKey;
  String? eTag;

  Items(
      {this.id,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.deletedBy,
      this.name,
      this.description,
      this.fileName,
      this.fileSize,
      this.filePath,
      this.fileKey,
      this.eTag});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    deletedAt = json['deletedAt'];
    deletedBy = json['deletedBy'];
    name = json['name'];
    description = json['description'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
    filePath = json['filePath'];
    fileKey = json['fileKey'];
    eTag = json['eTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['updatedAt'] = updatedAt;
    data['updatedBy'] = updatedBy;
    data['deletedAt'] = deletedAt;
    data['deletedBy'] = deletedBy;
    data['name'] = name;
    data['description'] = description;
    data['fileName'] = fileName;
    data['fileSize'] = fileSize;
    data['filePath'] = filePath;
    data['fileKey'] = fileKey;
    data['eTag'] = eTag;
    return data;
  }
}

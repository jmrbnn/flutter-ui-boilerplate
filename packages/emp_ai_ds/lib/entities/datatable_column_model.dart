class DatatableColumnModel {
  String? name;
  String? column;
  Function? builder;
  double? width;
  bool? isVisible;

  DatatableColumnModel({
    required this.name,
    required this.column,
    this.builder,
    this.width,
    this.isVisible,
  });

  DatatableColumnModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    column = json['column'];
    builder = json['builder'];
    width = json['width'];
    isVisible = json['isVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['column'] = column;
    data['builder'] = builder;
    data['width'] = width;
    data['isVisible'] = isVisible;
    return data;
  }
}

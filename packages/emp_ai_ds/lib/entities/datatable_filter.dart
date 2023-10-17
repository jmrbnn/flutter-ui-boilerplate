class DatatableFilter {
  late String key;
  late String value;

  DatatableFilter({required this.key, required this.value});

  DatatableFilter.fromJson(Map<String, dynamic> json) {
    key = json['key'] ?? '';
    value = json['value'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

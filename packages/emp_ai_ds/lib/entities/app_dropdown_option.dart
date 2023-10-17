import 'package:flutter/material.dart';

class AppDropdownOption {
  late String label;
  dynamic value;
  late bool enabled;
  Widget? leadingIcon;
  Widget? trailingIcon;

  AppDropdownOption({
    required this.label,
    this.value,
    this.enabled = true,
    this.leadingIcon,
    this.trailingIcon,
  });

  AppDropdownOption.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
    enabled = json['enabled'];
    leadingIcon = json['leadingIcon'];
    trailingIcon = json['trailingIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    data['enabled'] = enabled;
    data['leadingIcon'] = leadingIcon;
    data['trailingIcon'] = trailingIcon;
    return data;
  }
}

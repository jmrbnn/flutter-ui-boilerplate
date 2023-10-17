// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AppSwitchToggle extends StatefulWidget {
  bool isToggled;
  Function(bool)? onChange;
  bool isDisabled;
  AppSwitchToggle(
      {super.key,
      this.isToggled = true,
      this.onChange,
      this.isDisabled = false});

  @override
  State<AppSwitchToggle> createState() => _AppSwitchToggleState();
}

class _AppSwitchToggleState extends State<AppSwitchToggle> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 48.0,
      height: 25.0,
      valueFontSize: 25.0,
      toggleSize: 20.0,
      value: widget.isToggled,
      borderRadius: 30.0,
      padding: 3.0,
      activeColor: Theme.of(context).primaryColor,
      showOnOff: false,
      disabled: widget.isDisabled,
      onToggle: (val) {
        setState(() {
          widget.isToggled = val;
        });
        if (widget.onChange != null) {
          widget.onChange!(val);
        }
      },
    );
  }
}

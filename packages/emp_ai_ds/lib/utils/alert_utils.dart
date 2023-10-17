import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/app_flushbar.dart';
import 'package:emp_ai_ds/utils/app_shadows.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertUtils {
  WidgetRef? ref;
  String? title;
  String? description;
  Widget? action;
  BuildContext context;
  AlertPosition position;
  AlertStyle style;
  Color alertColor;

  AlertUtils(
    this.context, {
    this.ref,
    this.title,
    this.description,
    this.action,
    this.position = AlertPosition.bottomLeft,
    this.style = AlertStyle.floating,
    this.alertColor = const Color(0xFF5E79DC),
  });

  void success() {
    trigger(
        color: ref != null
            ? ref!.read(colorProvider).success
            : const Color(0xFF7FBA00));
  }

  void warning() {
    trigger(
        color: ref != null
            ? ref!.read(colorProvider).warning
            : const Color(0xFFFFC32B));
  }

  void error() {
    trigger(
        color: ref != null
            ? ref!.read(colorProvider).error
            : const Color(0xFFCF1A2F));
  }

  void neutral() {
    trigger(
        color: ref != null
            ? ref!.read(colorProvider).primary
            : const Color(0xFF5E79DC));
  }

  trigger({Color? color}) {
    AppFlushbar(
      titleText: (title == null || title == '') && action == null
          ? null
          : Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  title ?? '',
                  style: TextUtil(
                    context,
                  ).headingM(),
                ),
                action ?? DsUtils.emptyWidget,
              ],
            ),
      boxShadows: [
        AppShadows.lowBottom,
        AppShadows.lowTop,
      ],
      maxWidth: 600,
      backgroundColor:
          ref != null ? ref!.read(colorProvider).background : Colors.white,
      messageText: description == null
          ? null
          : Text(
              description ?? '',
              style: TextUtil(
                context,
                weight: FontWeight.w400,
                color: ref != null
                    ? ref!.read(colorProvider).contentGray
                    : const Color(0xFF697586),
              ).labelM(),
            ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: color ?? alertColor,
      margin: const EdgeInsets.all(6.0),
      flushbarStyle: style.style,
      flushbarPosition: position.side,
      textDirection: Directionality.of(context),
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }
}

enum AlertPosition {
  top('top', FlushbarPosition.TOP),
  bottom('bottom', FlushbarPosition.BOTTOM),
  bottomLeft('bottomLeft', FlushbarPosition.BOTTOMLEFT),
  ;

  const AlertPosition(this.label, this.side);
  final String label;
  final FlushbarPosition side;
}

enum AlertStyle {
  floating('floating', FlushbarStyle.FLOATING),
  grounded('grounded', FlushbarStyle.GROUNDED),
  ;

  const AlertStyle(this.label, this.style);
  final String label;
  final FlushbarStyle style;
}

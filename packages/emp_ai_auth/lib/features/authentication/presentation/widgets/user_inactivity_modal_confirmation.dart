import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/widgets/app_modal.dart';
import 'package:flutter/material.dart';

void launchUserInactivityModal(
  BuildContext context,
) {
  AppModal(
      body: Wrap(
    children: [
      Text(
        'Session timeout',
        style: TypeUtil(
          context: context,
        ).body(),
      ),
      const SizedBox(height: 8),
      Text(
        'Session timeout',
        style: TypeUtil(
          context: context,
        ).small(),
      ),
    ],
  )).toggleConfirmCloseModal(context);
}

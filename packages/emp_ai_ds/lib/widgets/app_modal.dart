import 'dart:developer';

import 'package:emp_ai_ds/utils/app_shadows.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';

// ignore: constant_identifier_names
enum ModalVariant { LARGE, MEDIUM }

class AppModal {
  Widget header;
  String? headerText;
  Widget body;
  Widget footer;
  double width;
  double? bodyHeight;
  bool barrierDismissible;
  bool isBodyPadded;
  bool hasFooter;
  EdgeInsets padding;
  Offset offset;
  bool showCloseButton;
  VoidCallback? onDismiss;
  bool enableDrag;
  bool confirmClose;
  AppModal({
    this.header = DsUtils.emptyWidget,
    this.headerText,
    this.body = DsUtils.emptyWidget,
    this.footer = DsUtils.emptyWidget,
    this.width = 416,
    this.bodyHeight,
    this.barrierDismissible = true,
    this.isBodyPadded = false,
    this.hasFooter = true,
    this.padding = const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
    this.offset = const Offset(0, 0),
    this.showCloseButton = true,
    this.onDismiss,
    this.enableDrag = true,
    this.confirmClose = false,
  });

  void toggleSidebarModal(context) {
    SideSheet.right(
      context: context,
      width: width,
      barrierDismissible: barrierDismissible,
      sheetColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: padding,
        child: Column(
          children: [
            Stack(
              children: [
                header,
                !showCloseButton
                    ? DsUtils.emptyWidget
                    : Align(
                        alignment: Alignment.topRight,
                        child: AppButton(
                          isIconButton: true,
                          onPressed: () {
                            if (confirmClose) {
                              toggleConfirmCloseModal(context);
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          icon: const Icon(Icons.close),
                        ))
              ],
            ),
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: MediaQuery.of(context).size.width < width
                    ? MediaQuery.of(context).size.width
                    : width,
                height: bodyHeight ??
                    (hasFooter
                        ? MediaQuery.of(context).size.height - 170
                        : MediaQuery.of(context).size.height - 120),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      body,
                    ],
                  ),
                ),
              );
            }),
            Visibility(visible: hasFooter, child: Expanded(child: footer))
          ],
        ),
      ),
    );
  }

  void toggleDialogModal(context) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext cxt) {
        return Transform.translate(
          offset: offset,
          child: Dialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              insetPadding: EdgeInsets.zero,
              child: SizedBox(
                width: width,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: width),
                      child: Container(
                        width: width,
                        padding: padding,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [AppShadows.highBottom],
                        ),
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  header,
                                  !showCloseButton
                                      ? DsUtils.emptyWidget
                                      : Align(
                                          alignment: Alignment.topRight,
                                          child: AppButton(
                                            isIconButton: true,
                                            onPressed: () {
                                              if (confirmClose) {
                                                toggleConfirmCloseModal(
                                                    context);
                                              } else {
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            icon: const Icon(Icons.close),
                                          ))
                                ],
                              ),
                              Padding(
                                padding: hasFooter
                                    ? const EdgeInsets.only(
                                        top: 16,
                                        bottom: 48,
                                      )
                                    : const EdgeInsets.only(top: 16),
                                child: body,
                              ),
                              !hasFooter ? DsUtils.emptyWidget : footer,
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    ).then((_) {
      log('Modal dismissed');
      if (onDismiss != null) {
        onDismiss!();
      }
    });
  }

  void toggleBottomModal(context) {
    showModalBottomSheet(
        isDismissible: barrierDismissible,
        enableDrag: enableDrag,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            side: BorderSide(width: 5, color: Colors.white)),
        builder: (BuildContext bc) {
          return Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [AppShadows.highTop],
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: header),
                    !showCloseButton
                        ? DsUtils.emptyWidget
                        : IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close),
                          )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Align(alignment: Alignment.topLeft, child: body),
                ),
                !hasFooter
                    ? DsUtils.emptyWidget
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: footer,
                      ),
              ],
            ),
          );
        }).then((_) {
      log('Modal dismissed');
      if (onDismiss != null) {
        onDismiss!();
      }
    });
  }

  void toggleConfirmCloseModal(context) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext cxt) {
        return Transform.translate(
          offset: offset,
          child: Dialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              // insetPadding: const EdgeInsets.all(10),
              child: SizedBox(
                width: width,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: width),
                      child: Container(
                        width: width,
                        padding: padding,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [AppShadows.highBottom],
                        ),
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 22),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Are you sure you want to leave?',
                                  style: TypeUtil(
                                    weight: FontWeight.w700,
                                  ).h5(),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Any changes you made on this page will be lost',
                                  style: TypeUtil().small(),
                                ),
                                const SizedBox(height: 32),
                                Wrap(
                                  children: [
                                    AppButton(
                                      labelText: 'Go back',
                                      width: 172,
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                    AppButton(
                                      labelText: 'Yes, leave',
                                      type: AppButtonTypes.outline,
                                      width: 172,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    ).then((_) {
      log('Modal dismissed');
      if (onDismiss != null) {
        onDismiss!();
      }
    });
  }
}

import 'dart:async';

import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class SetupMfaApp extends ConsumerStatefulWidget {
  final String secret;
  final String qr;
  final String? errorMessage;
  const SetupMfaApp({
    super.key,
    required this.secret,
    required this.qr,
    this.errorMessage,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetupMfaAppState();
}

class _SetupMfaAppState extends ConsumerState<SetupMfaApp> {
  TextEditingController pinCodeController = TextEditingController();

  StreamController<ErrorAnimationType> errorAnimationController =
      StreamController<ErrorAnimationType>();
  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();
  bool isCapturingImage = false;
  Uint8List? bytes;

  @override
  void dispose() {
    errorAnimationController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      oAuthStateNotifierProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          errorAnimationController.add(ErrorAnimationType.shake);
        }
      }),
    );

    return AppCard(
      hasShadow: false,
      padding: DsUtils.themeConfiguration(ref).setupMfaHeader != null
          ? EdgeInsets.zero
          : const EdgeInsets.only(right: 24, left: 24, top: 24),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: DsUtils.themeConfiguration(ref).setupMfaHeader == null,
            replacement: DsUtils.themeConfiguration(ref).setupMfaHeader ??
                DsUtils.emptyWidget,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: DsUtils.loadSvgFile(
                    path: 'assets/images/svg/emapta-outsourcing-reimagined.svg',
                    package: 'emp_ai_ds',
                    height: 20,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 24),
                Text(
                  'Secure your account',
                  textAlign: TextAlign.center,
                  style: TypeUtil(
                    context: context,
                    weight: FontWeight.w700,
                    fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                  ).h4(),
                ),
                const SizedBox(height: 8),
                Text(
                  'Scan the QR Code below using your preferred authenticator app and then enter the provided one-time code below.',
                  textAlign: TextAlign.center,
                  style: TypeUtil(
                    context: context,
                    fontFamily: DsUtils.themeConfiguration(ref).fontFamilyAlt,
                  ).small(),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(.5),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                WidgetsToImage(
                  controller: widgetsToImageController,
                  child: Container(
                    padding: isCapturingImage ? const EdgeInsets.all(24) : null,
                    color: isCapturingImage ? Colors.white : Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: isCapturingImage,
                          child: Align(
                            alignment: Alignment.center,
                            child: DsUtils.loadSvgFile(
                              path:
                                  'assets/images/svg/emapta-outsourcing-reimagined.svg',
                              package: 'emp_ai_ds',
                              height: 20,
                            ),
                          ),
                        ),
                        Center(
                          child: QrImageView(
                            data: widget.qr,
                            backgroundColor: isCapturingImage
                                ? Colors.white
                                : Colors.transparent,
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.3)),
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              Text(
                                widget.secret,
                                style: TypeUtil(
                                  context: context,
                                  weight: FontWeight.w600,
                                  fontFamily: DsUtils.themeConfiguration(ref)
                                      .fontFamily,
                                ).small(),
                              ),
                              isCapturingImage
                                  ? DsUtils.emptyWidget
                                  : GestureDetector(
                                      onTap: () async {
                                        await Clipboard.setData(
                                            ClipboardData(text: widget.secret));
                                      },
                                      child: Icon(
                                        Icons.copy_outlined,
                                        size: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(.8),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isCapturingImage = true;
                    });
                    await Future.delayed(const Duration(seconds: 1), () async {
                      setState(() {
                        isCapturingImage = false;
                      });
                    });
                    final bytes = await widgetsToImageController.capture();
                    setState(() {
                      this.bytes = bytes;
                      isCapturingImage = false;
                    });
                    if (this.bytes != null) {
                      // final blob = html.Blob(
                      //     <dynamic>[this.bytes], 'application/octet-stream');
                      // html.AnchorElement(
                      //     href: html.Url.createObjectUrlFromBlob(blob))
                      //   ..setAttribute('download', 'myemapta_authenticator.png')
                      //   ..click();

                      // ignore: use_build_context_synchronously
                      // if (GeneralUtils.checkIfMobileBrowser(context)) {
                      await WebImageDownloader.downloadImageFromUInt8List(
                          uInt8List: this.bytes as Uint8List);
                      // } else {
                      // try {
                      //   final blob = html.Blob(<dynamic>[this.bytes],
                      //       'image/png'); // Adjust the content type as needed

                      //   final anchor = html.AnchorElement(
                      //       href: html.Url.createObjectUrlFromBlob(blob))
                      //     ..setAttribute(
                      //         'download', 'myemapta_authenticator.png');

                      //   // Trigger the download
                      //   anchor.click();
                      // } catch (e) {
                      //   // ignore: use_build_context_synchronously
                      //   DsUtils.showSnackBar(
                      //       context, 'Error downloading file: $e');
                      // }
                      // }
                    }
                  },
                  child: Text(
                    'Download QR',
                    style: TypeUtil(
                      weight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: Theme.of(context).colorScheme.primary,
                    ).body(),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 24),
          Text(
            'Enter your one-time code below',
            textAlign: TextAlign.center,
            style: TypeUtil(
              context: context,
              weight: FontWeight.w700,
              fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
            ).body(),
          ),
          const SizedBox(height: 24),
          PinCodeTextField(
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            appContext: context,
            autoFocus: true,
            cursorColor: Theme.of(context).colorScheme.outline,
            autoDismissKeyboard: false,
            errorAnimationController: errorAnimationController,
            pinTheme: PinTheme(
              disabledColor: ref.read(colorProvider).border.withOpacity(.2),
              disabledBorderWidth: .5,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 50,
              activeFillColor: Colors.white,
              errorBorderColor: ref.read(colorProvider).error,
              activeColor: Theme.of(context).colorScheme.outline,
              inactiveColor: Theme.of(context).colorScheme.outline,
              selectedFillColor: Theme.of(context).colorScheme.error,
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Theme.of(context).colorScheme.surfaceTint,
            // enableActiveFill: true,
            controller: pinCodeController,
            onCompleted: (verificationCode) {
              ref
                  .read(oAuthStateNotifierProvider.notifier)
                  .setMfa(verificationCode, responseUrl: widget.qr);
            },
            beforeTextPaste: (text) {
              return true;
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}

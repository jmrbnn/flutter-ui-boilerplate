// ignore_for_file: constant_identifier_names

import 'package:emp_ai_ds/services/countdown_service.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_modal.dart';
// import 'package:emp_ai_ds/widgets/app_otp_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

typedef DynamicCallback = void Function(dynamic);

enum OtpFormType {
  EMAIL,
  SMS,
}

// ignore: must_be_immutable
class OtpForm extends StatelessWidget {
  final String title;
  final String subtitle;
  final DynamicCallback? onChange;
  final DynamicCallback? onCompleted;
  final DynamicCallback? onSubmit;
  final Duration? duration;
  final VoidCallback? onResend;
  final Rx<bool>? isProcessing;
  final Rx<bool>? isIncorrect;
  final TextStyle? titleStyle;
  final Alignment? titleAlignment;
  final TextStyle? subtitleStyle;
  final Alignment? subtitleAlignment;
  final bool isButtonBlock;
  final EdgeInsets headerPadding;
  final EdgeInsets bodyPadding;
  final OtpFormType otpType;
  OtpForm({
    Key? key,
    this.title = 'Security verification',
    this.subtitle = 'Enter the 6-digit code sent',
    this.onChange,
    this.onCompleted,
    this.onSubmit,
    this.duration,
    this.onResend,
    this.isProcessing,
    this.isIncorrect,
    this.isButtonBlock = false,
    this.titleStyle,
    this.titleAlignment,
    this.subtitleStyle,
    this.subtitleAlignment,
    this.headerPadding = const EdgeInsets.only(left: 20, right: 20, top: 16),
    this.bodyPadding = const EdgeInsets.only(left: 30, bottom: 16, right: 30),
    this.otpType = OtpFormType.EMAIL,
  }) : super(key: key);

  var countdownHasElapsed = false.obs;

  OtpFieldController otpController = OtpFieldController();

  Widget header(BuildContext context) {
    return Padding(
        padding: headerPadding,
        child: Column(
          children: [
            Align(
              alignment: titleAlignment ?? Alignment.centerLeft,
              child: Text(
                title,
                style: titleStyle ??
                    TypeUtil(context: context, weight: FontWeight.w700).h5(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: subtitleAlignment ?? Alignment.centerLeft,
              child: Text(
                subtitle,
                style: subtitleStyle ??
                    TypeUtil(
                      context: context,
                    ).body(),
              ),
            ),
          ],
        ));
  }

  Widget body(BuildContext context) {
    return FutureBuilder(
      future: duration != null
          ? Get.isRegistered(tag: (CountdownService).toString())
              ? Get.find(tag: (CountdownService).toString())
              : Get.put(CountdownService(
                  duration: duration ?? const Duration(minutes: 1),
                  onElapsed: () {
                    countdownHasElapsed(true);
                  })).init()
          : null,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (duration != null) {
            final countdownService = Get.find<CountdownService>();
            countdownService.startTimer();
            return form(context, countdownService);
          } else {
            return form(context, null);
          }
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }

  Widget form(BuildContext context, CountdownService? service) {
    var inputPin = ''.obs;
    var isCompleted = false.obs;
    var pinLength = 6;

    return Padding(
      padding: bodyPadding,
      child: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          OTPTextField(
              controller: otpController,
              length: pinLength,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldWidth: 50,
              fieldStyle: FieldStyle.underline,
              otpFieldStyle: OtpFieldStyle(
                borderColor: Theme.of(context).primaryColor,
                enabledBorderColor: AppColors.neutral.shade200,
                focusBorderColor: Theme.of(context).primaryColor,
              ),
              contentPadding: EdgeInsets.zero,
              outlineBorderRadius: 15,
              style: TypeUtil(context: context, weight: FontWeight.w700).h2(),
              onChanged: (pin) {
                onChange!(pin);
                inputPin(pin);
                if (pin.length < pinLength) {
                  isCompleted(false);
                }
              },
              onCompleted: (pin) {
                onCompleted!(pin);
                inputPin(pin);
                isCompleted(true);
              }),
          Obx(() => Visibility(
                visible: isIncorrect?.value ?? false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Code entered is incorrect',
                    style: TypeUtil(
                      context: context,
                      color: AppColors.error.shade800,
                    ).small(),
                  ),
                ),
              )),
          const SizedBox(
            height: 24,
          ),
          duration != null
              ? Obx(() => Align(
                    alignment: Alignment.centerLeft,
                    child: !countdownHasElapsed.value
                        ? service?.display()
                        : _resendOtp(context, service),
                  ))
              : DsUtils.emptyWidget,
          const SizedBox(
            height: 32,
          ),
          Obx(
            () => AppButton(
              // text: isProcessing!.value ? '...' : 'Submit',
              label: isProcessing!.value
                  ? const CircularProgressIndicator()
                  : Text(
                      'Submit',
                      style: TypeUtil(
                        context: context,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ).body(),
                    ),
              isDisabled: !isCompleted.value || isProcessing!.value,
              isBlock: isButtonBlock,
              onPressed: () => onSubmit!(inputPin.toString()),
            ),
          )
        ],
      ),
    );
  }

  _resendOtp(BuildContext context, CountdownService? service) {
    return RichText(
        text: TextSpan(
            text: 'Didn\'t get an ${otpType.name.toString().toLowerCase()}? ',
            style: TypeUtil(
                    context: context,
                    color: Theme.of(context).colorScheme.onBackground)
                .body(),
            children: [
          TextSpan(
              text: 'Send again',
              style: TypeUtil(
                context: context,
                color: Theme.of(context).primaryColor,
                weight: FontWeight.w500,
              ).body(),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onResend!();
                  service!.resetTimer();
                  service.startTimer();
                  countdownHasElapsed(false);
                })
        ]));
  }

  asModal(BuildContext context) {
    var isRegistered = Get.isRegistered(tag: (CountdownService).toString());

    return AppModal(
      header: header(context),
      barrierDismissible: false,
      padding: EdgeInsets.zero,
      onDismiss: () =>
          isRegistered ? Get.find<CountdownService>().resetTimer() : null,
      body: Column(
        children: [
          body(context),
        ],
      ),
    ).toggleDialogModal(context);
  }

  CountdownService service() {
    final countdownService = Get.find<CountdownService>();
    return countdownService;
  }

  bool isServiceRegistered() {
    return Get.isRegistered(tag: (CountdownService).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(context),
        Column(
          children: [
            body(context),
          ],
        )
      ],
    );
  }
}

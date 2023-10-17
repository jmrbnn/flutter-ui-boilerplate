import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_modal.dart';
import 'package:flutter/material.dart';

class OAuthUtils {
  // Helper method to encode bytes to base64url format
  static String base64UrlEncode(List<int> bytes) {
    return base64Url
        .encode(bytes)
        .replaceAll('=', '')
        .replaceAll('+', '-')
        .replaceAll('/', '_');
  }

  // Utility method to hash a string using SHA-256 and encode it to base64url format
  static String sha256Base64Url(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return base64UrlEncode(digest.bytes);
  }

  // Generate a random string of a given length
  static String generateRandomString(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  // Generate a secret code verifier
  static String generateCodeVerifier() {
    return generateRandomString(64);
  }

  // Generate the code challenge from the code verifier using S256 method
  static String generateCodeChallenge(String codeVerifier) {
    var bytes = utf8.encode(codeVerifier);
    var digest = sha256.convert(bytes);
    return base64UrlEncode(digest.bytes);
  }

  static final stringToBase64 = utf8.fuse(base64);
  static String base64ToStringDecode(encoded) =>
      utf8.decode(base64Url.decode(encoded));

  static String stringToBase64Encode(String? data) {
    var content = utf8.encode(data ?? '');
    var base64Data = base64Url.encode(content);
    return base64Data;
  }

  static bool isRealmAdmin() {
    List roles = EmpAuth().identity?.realmAccess?.roles ?? [];
    if (roles.contains('RealmSuperAdmin')) return true;

    return false;
  }

  static bool isClientAdmin() {
    List roles = EmpAuth().identity?.realmAccess?.roles ?? [];
    List resources = EmpAuth().identity?.resourceAccess?.keys.toList() ?? [];

    if (resources.contains('account')) {
      resources.remove('account');
    }
    if (roles.contains('RealmSuperAdmin') || resources.isNotEmpty) return true;

    return false;
  }

  static List getResourceAccessList() {
    List resourcesAccess =
        EmpAuth().identity?.resourceAccess?.keys.toList() ?? [];

    if (resourcesAccess.contains('account')) {
      resourcesAccess.remove('account');
    }
    return resourcesAccess;
  }

  static String? getClientId() {
    return EmpAuth().identity?.azp;
  }

  static void promptRefreshAccess(BuildContext context) {
    double width_ = 400;
    AppModal(
        width: width_,
        barrierDismissible: false,
        header: Text(
          'Session timed out',
          style: TypeUtil(
            weight: FontWeight.w600,
            color: DsUtils.color(context, ColorSets.neutral, variant: 50),
            fontFamily: 'Inter',
          ).body(),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width:
                  constraints.maxWidth < width_ ? constraints.maxWidth : width_,
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth < width_
                        ? constraints.maxWidth
                        : width_,
                    child: Text(
                      'Confirm changes',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: TypeUtil(
                              context: context,
                              fontFamily: 'Inter',
                              weight: FontWeight.w700)
                          .h4(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: constraints.maxWidth < width_
                        ? constraints.maxWidth
                        : width_,
                    child: Text(
                      'Do you want to change your password?',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style:
                          TypeUtil(context: context, fontFamily: 'Inter').h5(),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        hasFooter: true,
        footer: Align(
          alignment: Alignment.bottomRight,
          child: Wrap(
            spacing: 16,
            alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              AppButton(
                labelText: 'Ignore',
                type: AppButtonTypes.outline,
                customColor: Theme.of(context).primaryColor,
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              AppButton(
                labelText: 'Yes, still here',
                onPressed: () => {},
              )
            ],
          ),
        )).toggleDialogModal(context);
  }
}

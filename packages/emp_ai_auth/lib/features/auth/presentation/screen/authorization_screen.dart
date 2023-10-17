import 'package:flutter/widgets.dart';

class AuthorizationScreen extends StatefulWidget {
  // final Uri authorizationUrl;
  // final void Function(Uri redirectUrl) onAuthorizationCodeRedirectAttempt;
  const AuthorizationScreen({
    super.key,
    // required this.authorizationUrl,
    // required this.onAuthorizationCodeRedirectAttempt,
  });

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

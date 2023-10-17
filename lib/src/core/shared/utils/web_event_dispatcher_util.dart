// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'dart:html';

enum OAuthEvents {
  // appLoaded('App Loaded', 'app-loaded'),
  authenticated('Authenticated', 'authenticated'),
  loggedOut('Logged out', 'logged-out'),
  introspect('Introspect', 'introspect'),
  refreshToken('Refresh Token', 'refresh-token'),
  expired('Expired Access token', 'expired'),
  ;

  const OAuthEvents(this.name, this.eventTag);
  final String name;
  final String eventTag;
}

class WebEventUtil {
  static void dispatch(OAuthEvents event) {
    html.window.dispatchEvent(Event(event.eventTag));
  }

  static void listen(OAuthEvents event, callback) {
    html.window.addEventListener(event.eventTag, callback, false);
  }
}

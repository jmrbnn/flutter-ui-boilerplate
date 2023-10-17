import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  Map<String, dynamic> toJson() {
    return {
      'primary':
          '"#${primary.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onPrimary':
          '"#${onPrimary.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'primaryContainer':
          '"#${primaryContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onPrimaryContainer':
          '"#${onPrimaryContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'secondary':
          '"#${secondary.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onSecondary':
          '"#${onSecondary.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'secondaryContainer':
          '"#${secondaryContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onSecondaryContainer':
          '"#${onSecondaryContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'tertiary':
          '"#${tertiary.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onTertiary':
          '"#${onTertiary.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'tertiaryContainer':
          '"#${tertiaryContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onTertiaryContainer':
          '"#${onTertiaryContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'error':
          '"#${error.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onError':
          '"#${onError.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'errorContainer':
          '"#${errorContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onErrorContainer':
          '"#${onErrorContainer.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'outline':
          '"#${outline.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'outlineVariant':
          '"#${outlineVariant.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'background':
          '"#${background.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onBackground':
          '"#${onBackground.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'surface':
          '"#${surface.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onSurface':
          '"#${onSurface.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'surfaceVariant':
          '"#${surfaceVariant.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onSurfaceVariant':
          '"#${onSurfaceVariant.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'inverseSurface':
          '"#${inverseSurface.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'onInverseSurface':
          '"#${onInverseSurface.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'inversePrimary':
          '"#${inversePrimary.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'shadow':
          '"#${shadow.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'scrim':
          '"#${scrim.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
      'surfaceTint':
          '"#${surfaceTint.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}"',
    };
  }
}

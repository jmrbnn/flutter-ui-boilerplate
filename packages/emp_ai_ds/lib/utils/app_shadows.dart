import 'package:flutter/cupertino.dart';

class AppShadows {
  // Card shadows
  // Card Default
  static BoxShadow cardDefault = BoxShadow(
    offset: const Offset(0, 1),
    blurRadius: 4,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.05),
  );
  // Card Hovered
  static BoxShadow cardHovered = BoxShadow(
    offset: const Offset(0, 0),
    blurRadius: 20,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.2),
  );

  // Low Shadows
  static BoxShadow lowBottom = BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );
  static BoxShadow lowTop = BoxShadow(
    offset: const Offset(0, -2),
    blurRadius: 4,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );
  static BoxShadow lowLeft = BoxShadow(
    offset: const Offset(-2, 0),
    blurRadius: 4,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );
  static BoxShadow lowRight = BoxShadow(
    offset: const Offset(2, 0),
    blurRadius: 4,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );

  // Medium Shadows
  static BoxShadow mediumBottom = BoxShadow(
    offset: const Offset(0, 8),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );
  static BoxShadow mediumTop = BoxShadow(
    offset: const Offset(0, -8),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );
  static BoxShadow mediumLeft = BoxShadow(
    offset: const Offset(-8, 0),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );
  static BoxShadow mediumRight = BoxShadow(
    offset: const Offset(8, 0),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.12),
  );

  // High Shadows
  static BoxShadow highBottom = BoxShadow(
    offset: const Offset(0, 16),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.16),
  );
  static BoxShadow highTop = BoxShadow(
    offset: const Offset(0, -16),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.16),
  );
  static BoxShadow highLeft = BoxShadow(
    offset: const Offset(-16, 0),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.16),
  );
  static BoxShadow highRight = BoxShadow(
    offset: const Offset(16, 0),
    blurRadius: 24,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.16),
  );

  // Very High Shadows
  static BoxShadow vHighBottom = BoxShadow(
    offset: const Offset(0, 24),
    blurRadius: 32,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.2),
  );
  static BoxShadow vHighTop = BoxShadow(
    offset: const Offset(0, -24),
    blurRadius: 32,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.2),
  );
  static BoxShadow vHighLeft = BoxShadow(
    offset: const Offset(-24, 0),
    blurRadius: 32,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.2),
  );
  static BoxShadow vHighRight = BoxShadow(
    offset: const Offset(24, 0),
    blurRadius: 32,
    spreadRadius: 0,
    color: const Color(0xFF000000).withOpacity(0.2),
  );
}

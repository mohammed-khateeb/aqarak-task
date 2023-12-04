import 'package:flutter/material.dart';

import 'bottom_bar_constant.dart';

class BottomBarPainter extends CustomPainter {
  BottomBarPainter(
      {required this.position,
        required this.color,
        required this.showShadow,
        required this.notchColor})
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true,
        _shadowColor = Colors.grey.shade600,
        _notchPaint = Paint()
          ..color = notchColor
          ..isAntiAlias = true;

  /// position
  final double position;

  /// Color for the bottom bar
  final Color color;

  /// Paint value to custom painter
  final Paint _paint;

  /// Shadow Color
  final Color _shadowColor;

  /// Boolean to show shadow
  final bool showShadow;

  /// Paint Value of notch
  final Paint _notchPaint;

  /// Color for the notch
  final Color notchColor;

  @override
  void paint(Canvas canvas, Size size) {
    _drawBar(canvas, size);
  }

  @override
  bool shouldRepaint(BottomBarPainter oldDelegate) {
    return position != oldDelegate.position || color != oldDelegate.color;
  }

  /// draw bottom bar
  void _drawBar(Canvas canvas, Size size) {
    final double left = 0;
    final double right = size.width ;
    final double top = size.height*0.22;
    final double bottom = top + size.height;

    final path = Path()
      ..moveTo(left + kTopRadius, top)
      ..lineTo(position - kTopRadius, top)
      ..relativeArcToPoint(
        const Offset(kTopRadius, kTopRadius),
        radius: const Radius.circular(kTopRadius),
      )
      ///circle
      ..lineTo(position, kCircleRadius * 1.8)
      ..relativeArcToPoint(
        const Offset(kTopRadius, kTopRadius),
        radius: const Radius.circular(kTopRadius),
        clockwise: false
      )
      ..lineTo(position + kCircleRadius * 2 + kCircleMargin * 2 - kTopRadius, kCircleRadius * 1.8 + kTopRadius)
      ..relativeArcToPoint(
          const Offset(kTopRadius,- kTopRadius),
          radius: const Radius.circular(kTopRadius),
          clockwise: false
      )
      ..lineTo(position + kCircleRadius * 2 + kCircleMargin * 2 , top + kCircleMargin)
    // ..relativeArcToPoint(
      //   const Offset((kCircleRadius + kCircleMargin) * 2, 0.0),
      //   radius: const Radius.circular(kCircleRadius + kCircleMargin),
      //   clockwise: false,
      // )
      ..relativeArcToPoint(
        const Offset(kTopRadius, -kTopRadius),
        radius: const Radius.circular(kTopRadius),
      )
      ..lineTo(right - kTopRadius, top)
      ..relativeArcToPoint(
        const Offset(kTopRadius, kTopRadius),
        radius: const Radius.circular(kTopRadius),
      )
      ..lineTo(right, bottom )
      ..lineTo(left , bottom)
      ..lineTo(left, top + kTopRadius)
      ..relativeArcToPoint(
        const Offset(kTopRadius, -kTopRadius),
        radius: const Radius.circular(kTopRadius),
      );
    if (this.showShadow) {
      canvas..drawShadow(path, _shadowColor, 5.0, true);
    }
    canvas.drawPath(path, _paint);
  }

}

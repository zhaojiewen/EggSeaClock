import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// It is hard to paint 3D water surface ;
class WaterSurface extends StatelessWidget {
  WaterSurface(this.color);
  Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _WavePainter(color));
  }
}

class _WavePainter extends CustomPainter {
  _WavePainter(this.color);
  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    var center = (Offset.zero & size).center;

    var waveCenter = Offset(center.dx, center.dy + size.height * 2 / 6 + 5);
    var waveRect = Rect.fromCenter(
        center: waveCenter, width: size.width / 3, height: size.height / 12);

    var smallWaveCenter =
        Offset(center.dx, center.dy + size.height * 2 / 6 + 2);

    var smallWaveRect = Rect.fromCenter(
        center: smallWaveCenter,
        width: size.width / 7 - 10,
        height: size.height / 24);
    canvas.drawArc(waveRect, 0, 2 * pi, false, paint);

    paint.color = Color.fromARGB(
        255, 255 - color.red, 255 - color.green, 255 - color.blue);
    canvas.drawArc(smallWaveRect, 0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

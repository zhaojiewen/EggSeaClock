import 'dart:math';

import 'package:flutter/cupertino.dart';

class ClockPlate extends StatelessWidget {
  final double radius;
  final double painterThickness;
  final Color color;

  const ClockPlate(this.radius, this.painterThickness, this.color);

  @override
  Widget build(BuildContext context) {
    final length = 2 * (radius + 1);
    return Stack(children: <Widget>[
      CustomPaint(
          size: Size(length, length),
          painter: _GridPlatePainter(radius * 2 / 3, painterThickness, color)),
      CustomPaint(
        size: Size(length, length),
        painter: _EggPainter(radius, painterThickness, color),
      )
    ]);
  }
}

class _EggPainter extends CustomPainter {
  _EggPainter(this.radius, this.painterThickness, this.color);

  double radius;
  double painterThickness;

  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = painterThickness;

    final center = (Offset.zero & size).center;

    final dy = 30;

    Rect semiTopEllipticRect = Rect.fromCenter(
        center: center, width: 2 * radius, height: 2 * radius + dy);
    Rect semiBottomEllipticRect = Rect.fromCenter(
        center: center, width: 2 * radius, height: 2 * radius + 3 * dy);

    canvas.drawArc(semiTopEllipticRect, pi, pi, false, paint);

    canvas.drawArc(semiBottomEllipticRect, 0, pi, false, paint);
  }

  @override
  bool shouldRepaint(_EggPainter oldDelegate) {
    return oldDelegate.radius != radius ||
        oldDelegate.painterThickness != painterThickness ||
        oldDelegate.color != color;
  }
}

class _GridPlatePainter extends CustomPainter {
  _GridPlatePainter(this.radius, this.painterThickness, this.color);
  double radius;
  double painterThickness;

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = painterThickness
      ..style = PaintingStyle.stroke
      ..color = color;

    final center = (Offset.zero & size).center;
    canvas.drawCircle(center, radius, paint);

    final p1h = Offset(0, center.dy);
    final p2h = Offset(2 * radius, center.dy);
    // canvas.drawLine(p1h, p2h, paint);

    final p1v = Offset(center.dx, 0);
    final p2v = Offset(center.dx, 2 * radius);
    // canvas.drawLine(p1v, p2v, paint);

    // final centerTop = Offset(center.dx, 0);
    // final centerBottom = Offset(center.dx, size.height);

    // according to: cosValue = acos(sin(pi/6) * radius / 2 * sin(pi/12) * radius) = cos(pi/12)
    //  startAngle1 = acos(cosValue) = pi/12;
    // var startAngle1 = pi / 12;
    // var sweepAngle1 = pi - 2 * startAngle1;

    // var point = Offset(radius * cos(pi/3), radius * cos(pi/6));
    // var pointTransform = Offset(center.dx - point.dx , center.dy - point.dy);
    // var point1 = Offset(point.dy, point.dx);
    // var point1Transform = Offset(center.dx - point1.dx , center.dy - point1.dy);

    // canvas.drawLine(center, pointTransform, paint);
    // canvas.drawLine(center, point1Transform, paint);

    // // according to elliptic equations: pow(x/a,2) + pow(y/b,2) = 1,
    // final double widthLevel1 =  2 * sqrt(pow(point.dx, 2) / (1 - pow((point.dy - radius)/ radius/3 , 2)));

    // final heightLevel1 = 2 * radius / 3;

    // final double widthLevel2 = 2 * sqrt(pow(point.dy, 2) / (1 - pow((point.dx - radius)/ radius * 2/3 , 2)));

    // final heightLevel2 = 2 * heightLevel1;

    // var rect1 = Rect.fromCenter(center: centerTop , width: widthLevel1 , height: heightLevel1);

    // canvas.drawArc(rect1,startAngle1 , sweepAngle1, false, paint);

    // var rect2 = Rect.fromCenter(center: centerTop , width: widthLevel2 ,height: heightLevel2);
    // var startAngle2 = pi / 6;
    // var sweepAngle2 = pi - 2 * startAngle2;
    // canvas.drawArc(rect2,startAngle2 , sweepAngle2, false, paint);

    // var rect3 = Rect.fromCenter(center: centerBottom,width: widthLevel2,height:heightLevel2);
    // var startAngle3 = pi + startAngle2;
    // var sweepAngle3 = sweepAngle2;
    // canvas.drawArc(rect3 ,startAngle3 , sweepAngle3, false, paint);

    // var rect4 = Rect.fromCenter(center: centerBottom,width: widthLevel1,height:heightLevel1);
    // var startAngle4 = pi + startAngle1;
    // var sweepAngle4 = sweepAngle1;
    // canvas.drawArc(rect4 ,startAngle4 , sweepAngle4, false, paint);
  }

  @override
  bool shouldRepaint(_GridPlatePainter oldDelegate) {
    return oldDelegate.radius != radius ||
        oldDelegate.painterThickness != painterThickness ||
        oldDelegate.color != color;
  }
}

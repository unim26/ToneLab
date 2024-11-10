import 'dart:ui';

import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  final List<int> oneCycleData;

  MyPainter(this.oneCycleData);

  @override
  void paint(Canvas canvas, Size size) {
    var i = 0;
    List<Offset> maxPoints = [];

    final t = size.width / (oneCycleData.length - 1);
    for (var i0 = 0, len = oneCycleData.length; i0 < len; i0++) {
      maxPoints.add(Offset(
          t * i,
          size.height / 2 -
              oneCycleData[i0].toDouble() / 32767.0 * size.height / 2));
      i++;
    }

    final paint = Paint()
      ..color = Colors.yellow.shade700
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.polygon, maxPoints, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    if (oneCycleData != oldDelegate.oneCycleData) {
      return true;
    }
    return false;
  }
}


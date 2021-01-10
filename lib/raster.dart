import 'dart:developer' as developer;

import 'package:flutter/material.dart';

class Raster extends StatelessWidget {
  final double pixelSize;

  const Raster({Key? key, required this.pixelSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RasterPainter(pixelSize: pixelSize),
    );
  }
}

class RasterPainter extends CustomPainter {
  final double pixelSize;

  const RasterPainter({required this.pixelSize});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    developer.log(
      'rect (Offset.zero & size):',
      name: 'RasterPainter',
      error: rect,
    );

    var paint = Paint()..color = Colors.grey;

    for (double x = 0; x <= size.width; x += pixelSize) {
      // Draw vertical line
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += pixelSize) {
      // Draw horizontal line
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant RasterPainter oldDelegate) {
    return oldDelegate.pixelSize != pixelSize;
  }
}

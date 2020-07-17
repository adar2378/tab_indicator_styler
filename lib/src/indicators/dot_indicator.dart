import 'package:flutter/material.dart';

class DotIndicator extends Decoration {
  /// Radius of the dot, default set to 3
  final double radius;

  /// Color of the dot, default set to [Colors.blue]
  final Color color;

  /// Distance from the center, if you the value is positive, the dot will be positioned below the tab's center
  /// if the value is negative, then dot will be positioned above the tab's center, default set to 8
  final double distanceFromCenter;

  /// [PagingStyle] determines if the indicator should be fill or stroke
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke], default set to 2
  final double strokeWidth;

  DotIndicator({
    this.paintingStyle = PaintingStyle.fill,
    this.radius = 3,
    this.color = Colors.blue,
    this.distanceFromCenter = 8,
    this.strokeWidth = 2,
  });
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(
      this,
      onChanged,
      radius,
      color,
      paintingStyle,
      distanceFromCenter,
      strokeWidth,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final DotIndicator decoration;
  final double radius;
  final Color color;
  final double distanceFromCenter;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  _CustomPainter(
    this.decoration,
    VoidCallback onChanged,
    this.radius,
    this.color,
    this.paintingStyle,
    this.distanceFromCenter,
    this.strokeWidth,
  )   : assert(
          decoration != null,
          color != null,
        ),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    assert(strokeWidth >= 0 &&
        strokeWidth < configuration.size.width / 2 &&
        strokeWidth < configuration.size.height / 2);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size.width / 2;
    double yAxisPos =
        offset.dy + configuration.size.height / 2 + distanceFromCenter;
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = strokeWidth;
    canvas.drawCircle(Offset(xAxisPos, yAxisPos), radius, paint);
  }
}

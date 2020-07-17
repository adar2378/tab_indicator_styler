import 'package:flutter/material.dart';

class RectangularIndicator extends Decoration {
  /// topRight radius of the indicator, default to 5.
  final double topRightRadius;

  /// topLeft radius of the indicator, default to 5.
  final double topLeftRadius;

  /// bottomRight radius of the indicator, default to 0.
  final double bottomRightRadius;

  /// bottomLeft radius of the indicator, default to 0
  final double bottomLeftRadius;

  /// Color of the indicator
  final Color color;

  /// Horizontal padding of the indicator
  final double horizontalPadding;

  /// Vertical padding of the indicator
  final double verticalPadding;

  /// [PagingStyle] determines if the indicator should be fill or stroke, default to fill
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke]
  final double strokeWidth;

  RectangularIndicator({
    this.topRightRadius = 5,
    this.topLeftRadius = 5,
    this.bottomRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.color = Colors.black,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeWidth = 2,
  });
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(
      this,
      onChanged,
      bottomLeftRadius: bottomLeftRadius,
      bottomRightRadius: bottomRightRadius,
      color: color,
      horizontalPadding: horizontalPadding,
      topLeftRadius: topLeftRadius,
      topRightRadius: topRightRadius,
      verticalPadding: verticalPadding,
      paintingStyle: paintingStyle,
      strokeWidth: strokeWidth,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final RectangularIndicator decoration;
  final double topRightRadius;
  final double topLeftRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final Color color;
  final double horizontalPadding;
  final double verticalPadding;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  _CustomPainter(
    this.decoration,
    VoidCallback onChanged, {
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    this.color,
    this.horizontalPadding,
    this.verticalPadding,
    this.paintingStyle,
    this.strokeWidth,
  })  : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    assert(horizontalPadding != null && horizontalPadding >= 0);
    assert(horizontalPadding < configuration.size.width / 2,
        "Padding must be less than half of the size of the tab");
    assert(color != null);
    assert(verticalPadding != null &&
        verticalPadding < configuration.size.height / 2 &&
        verticalPadding >= 0);

    assert(topRightRadius != null);
    assert(topLeftRadius != null);
    assert(bottomRightRadius != null);
    assert(bottomLeftRadius != null);
    assert(strokeWidth >= 0 &&
        strokeWidth < configuration.size.width / 2 &&
        strokeWidth < configuration.size.height / 2);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    Size mysize = Size(configuration.size.width - (horizontalPadding * 2),
        configuration.size.height - (2 * verticalPadding));

    Offset myoffset =
        Offset(offset.dx + (horizontalPadding), offset.dy + verticalPadding);
    final Rect rect = myoffset & mysize;
    final Paint paint = Paint();
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = 3;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          bottomRight: Radius.circular(bottomRightRadius),
          bottomLeft: Radius.circular(bottomLeftRadius),
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
        ),
        paint);
  }
}

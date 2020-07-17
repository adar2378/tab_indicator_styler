import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaterialIndicator extends Decoration {
  /// Height of the indicator. Defaults to 4
  final double height;

  /// Determines to location of the tab, [TabPosition.bottom] set to default.
  final TabPosition tabPosition;

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

  /// [PagingStyle] determines if the indicator should be fill or stroke, default to fill
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke]
  final double strokeWidth;

  MaterialIndicator({
    this.height = 4,
    this.tabPosition = TabPosition.bottom,
    this.topRightRadius = 5,
    this.topLeftRadius = 5,
    this.bottomRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.color = Colors.black,
    this.horizontalPadding = 0,
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
      height: height,
      horizontalPadding: horizontalPadding,
      tabPosition: tabPosition,
      topLeftRadius: topLeftRadius,
      topRightRadius: topRightRadius,
      paintingStyle: paintingStyle,
      strokeWidth: strokeWidth,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final MaterialIndicator decoration;
  final double height;
  final TabPosition tabPosition;
  final double topRightRadius;
  final double topLeftRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final Color color;
  final double horizontalPadding;
  final double strokeWidth;
  final PaintingStyle paintingStyle;

  _CustomPainter(
    this.decoration,
    VoidCallback onChanged, {
    this.height,
    this.tabPosition,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    this.color,
    this.horizontalPadding,
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
    assert(height != null && height > 0);
    assert(tabPosition != null);
    assert(topRightRadius != null);
    assert(topLeftRadius != null);
    assert(bottomRightRadius != null);
    assert(bottomLeftRadius != null);
    assert(strokeWidth >= 0 &&
        strokeWidth < configuration.size.width / 2 &&
        strokeWidth < configuration.size.height / 2);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    Size mysize =
        Size(configuration.size.width - (horizontalPadding * 2), height);

    Offset myoffset = Offset(
      offset.dx + (horizontalPadding),
      offset.dy +
          (tabPosition == TabPosition.bottom
              ? configuration.size.height - height
              : 0),
    );

    final Rect rect = myoffset & mysize;
    final Paint paint = Paint();
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = strokeWidth;
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

enum TabPosition { top, bottom }

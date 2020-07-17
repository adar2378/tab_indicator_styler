<p align="center">
  <img width="460"  src="https://github.com/adar2378/tab_indicator_styler/raw/master/images/tab_styler_logo.png">
</p>

<a href = "https://pub.dev/packages/tab_indicator_styler"><img src="https://img.shields.io/pub/v/tab_indicator_styler"></a>

Add beautiful and trending tab indicators directly to your default Flutter TabBar.

## Features 💚

- Supports Android, iOS, Web
- Can be directly added to the default TabBar
- 3 different styles of TabIndicator
- Highly customizable

## Demo

<p align="center">
  <img src="https://github.com/adar2378/tab_indicator_styler/raw/master/images/demo.gif" width="240" height="480"> 
</p>

## Styles

#### DotIndicator
```Dart
 /// Radius of the dot
  final double radius;

  /// Color of the dot
  final Color color;

  /// Distance from the center, if you the value is positive, the dot will be positioned below the tab's center
  /// if the value is negative, then dot will be positioned above the tab's center
  final double distanceFromCenter;

  /// [PagingStyle] determines if the indicator should be fill or stroke
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke]
  final double strokeWidth;

```

### MaterialIndicator
```Dart
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

  /// Color of the indicator, default set to [Colors.black]
  final Color color;

  /// Horizontal padding of the indicator, default set 0
  final double horizontalPadding;

  /// [PagingStyle] determines if the indicator should be fill or stroke, default to fill
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke], default set to 2
  final double strokeWidth;
```

#### RectangularIndicator
```Dart
/// topRight radius of the indicator, default to 5.
  final double topRightRadius;

  /// topLeft radius of the indicator, default to 5.
  final double topLeftRadius;

  /// bottomRight radius of the indicator, default to 0.
  final double bottomRightRadius;

  /// bottomLeft radius of the indicator, default to 0
  final double bottomLeftRadius;

  /// Color of the indicator, default set to [Colors.black]
  final Color color;

  /// Horizontal padding of the indicator, default set to 0
  final double horizontalPadding;

  /// Vertical padding of the indicator, default set to 0
  final double verticalPadding;

  /// [PagingStyle] determines if the indicator should be fill or stroke, default to fill
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke], default set to 0
  final double strokeWidth;

```

import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Missile extends PositionComponent {
  static const speed = 200.0;
  static final _paint = BasicPalette.white.paint();

  Missile(Vector2 position) : super(position: position, size: Vector2(5, 35), anchor: Anchor.center);

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(-2.5, 0, size.x, size.y),
      _paint,
    );
  }

  @override
  void update(double dt) {
    position.y -= speed * dt;
    if (position.y + size.y < 0) {
      removeFromParent();
    }
  }
}
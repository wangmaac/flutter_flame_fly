import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

class EnemyMissile extends PositionComponent with HasGameReference<MyGame>, CollisionCallbacks {
  static const speed = 200.0;
  static final _paint = BasicPalette.red.paint();

  EnemyMissile(Vector2 position) : super(position: position, size: Vector2(5, 5), anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += speed * dt;
    if (position.y + size.y > game.size.y) {
      removeFromParent();
    }
  }
}

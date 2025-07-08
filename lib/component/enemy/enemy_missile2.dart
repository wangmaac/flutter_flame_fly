import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

class EnemyMissile2 extends PositionComponent with HasGameReference<MyGame>, CollisionCallbacks {
  static const speed = 200.0;
  static final _paint = BasicPalette.red.paint();

  EnemyMissile2(Vector2 position) : super(position: position, size: Vector2(5, 5), anchor: Anchor.center);

  Vector2 direction = Vector2.zero();
  Vector2 velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox());
    direction = game.player.position - position;
    velocity = direction.normalized() * speed;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // direction = game.player.position - position;
    // velocity = direction.normalized() * speed;
    position.y += speed * dt;
    position.x += velocity.x * dt;
    if (position.y + size.y > game.size.y) {
      removeFromParent();
    }
  }
}

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_flame_fly/component/enemy/enemy.dart';
import 'package:flutter_flame_fly/component/enemy/enemy_missile.dart';
import 'package:flutter_flame_fly/component/enemy/enemy_missile2.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

import 'plyaer_missile.dart';

class Player extends SpriteComponent with HasGameReference<MyGame>, CollisionCallbacks {
  double _timeSinceLastSpawn = 0;
  final double spawnInterval = 1; // 1초

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    final image = Flame.images.fromCache('player_image.png');
    sprite = Sprite(image, srcPosition: Vector2(109, 1), srcSize: Vector2(105, 96));
    add(RectangleHitbox());
    anchor = Anchor.center;
    position = Vector2(game.size.x / 2, game.size.y - size.y / 2);
  }

  void movePointLeft(double dx) {
    position.x = dx.clamp(size.x / 2, game.size.x - size.x);
  }

  void movePointRight(double dx) {
    position.x = dx.clamp(size.x / 2, game.size.x - size.x / 2);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is EnemyMissile2 || other is Enemy) {
      game.pauseEngine();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceLastSpawn += dt;
    if (_timeSinceLastSpawn >= spawnInterval) {
      print(position);
      final missile = PlayerMissile(position.clone()..translate(0, 0));
      missile.priority = 10;
      game.add(missile);
      _timeSinceLastSpawn = 0; // Reset timer
    }
  }
}

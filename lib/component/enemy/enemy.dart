import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter_flame_fly/component/enemy/enemy_missile2.dart';
import 'package:flutter_flame_fly/component/player/plyaer_missile.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

class Enemy extends SpriteComponent with HasGameReference<MyGame>, CollisionCallbacks {
  late Direction direction;

  double _timeSinceLastSpawn = 0;
  final int spawnInterval = Random().nextInt(3) + 1; // 1초

  int energy = Random().nextInt(20) + 1;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    direction = Direction.right;

    Image enemyImage = await Flame.images.load('enemy-50.png');
    sprite = Sprite(enemyImage);
    add(RectangleHitbox());
    final size = Vector2(sprite!.src.width / 2, sprite!.src.height / 2);
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    if (game.enemyDirection == Direction.right) {
      position.x += 2;
      //! right 벽에 닿으면,
      if (position.x >= game.size.x - (size.x / 2)) {
        game.changeEnemyDirection();
      }
    } else {
      position.x -= 2;
      //! 벽에 닿으면,
      if (position.x <= size.x / 2) {
        game.changeEnemyDirection();
      }
    }

    _timeSinceLastSpawn += dt;
    if (_timeSinceLastSpawn >= spawnInterval) {
      final missile = EnemyMissile2(position.clone()..translate(0, 0));
      missile.priority = 1;
      game.add(missile);
      _timeSinceLastSpawn = 0; // Reset timer
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerMissile) {
      energy--;
    }
    if (energy <= 0) {
      removeFromParent();
    }
  }
}

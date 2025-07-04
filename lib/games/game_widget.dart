import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_fly/component/enemy/enemy.dart';
import 'package:flutter_flame_fly/component/player/player.dart';

class GameWidgetPage extends StatelessWidget {
  const GameWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MyGame());
  }
}

enum Direction { left, right }

class MyGame extends FlameGame with PanDetector {
  late Direction enemyDirection;
  bool isTouchWall = false;
  List<Enemy> enemies = [];
  final Player player = Player();

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    enemyDirection = Direction.right;
    await Flame.images.load('player_image.png');

    //포지션이 변화한다.
    //add 할때 onload를 실행한다. 그러므로 enemy안에서  position을 정하면 먹어버린다.
    add(player);
    spawnEnemies();
  }

  void spawnEnemies() {
    int enemyCount = 5;
    double enemyWidth = 50;
    double y = 25;
    double totalWidth = enemyCount * enemyWidth;
    double startX = (size.x - totalWidth) / 2;

    for (var i = 0; i < enemyCount; ++i) {
      Enemy e = Enemy();
      e.position = Vector2(startX + i * enemyWidth, y);
      enemies.add(e);
    }
    addAll(enemies);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  void changeEnemyDirection() {
    enemyDirection = enemyDirection == Direction.right ? Direction.left : Direction.right;
    isTouchWall = !isTouchWall;
    for (var o in enemies) {
      o.position.y += 50;
    }
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    final delta = info.delta.global.x;
    final dx = info.eventPosition.global.x;
    if (delta < 0) {
      player.movePointLeft(dx);
      // player.shieldItem.movePointLeft(dx);
    } else if (delta > 0) {
      player!.movePointRight(dx);
      // player!.shieldItem.movePointRight(dx);
    }
  }
}

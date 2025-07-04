import 'dart:async';
import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/src/components/core/component.dart';
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

class MyGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load('player_image.png');

    //포지션이 변화한다.
    //add 할때 onload를 실행한다. 그러므로 enemy안에서  position을 정하면 먹어버린다.
    Player play = Player();
    add(play);
    spawnEnemies();
  }

  void spawnEnemies() {
    List<Enemy> enemies = [];
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
}

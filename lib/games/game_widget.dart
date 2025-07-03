import 'dart:async';
import 'dart:math';

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

class MyGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load('player_image.png');
    await Flame.images.load('enemy.png');

    Enemy enemy = Enemy();
    enemy.angle = pi / 180;

    addAll([Player(), enemy]);
    enemy.position = Vector2(300, 300);

    // add(Player());
    // add(Enemy());
  }
}

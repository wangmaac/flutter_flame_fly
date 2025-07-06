import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

class Enemy extends SpriteComponent with HasGameReference<MyGame> {
  late Direction direction;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    direction = Direction.right;

    Image enemyImage = await Flame.images.load('enemy-50.png');
    sprite = Sprite(enemyImage);
    final size = Vector2(sprite!.src.width / 2, sprite!.src.height / 2);
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    if (game.enemyDirection == Direction.right) {
      position.x++;
      //! right 벽에 닿으면,
      if (position.x >= game.size.x - (size.x / 2)) {
        game.changeEnemyDirection();
      }
    } else {
      position.x--;
      //! 벽에 닿으면,
      if (position.x <= size.x / 2) {
        game.changeEnemyDirection();
      }
    }
  }
}

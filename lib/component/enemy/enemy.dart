import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

class Enemy extends SpriteComponent with HasGameReference<MyGame> {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    Image enemyImage = await Flame.images.load('enemy-50.png');
    sprite = Sprite(enemyImage);
    final size = Vector2(sprite!.src.width / 2, sprite!.src.height / 2);
    anchor = Anchor.center;
    // position = Vector2(game.size.x / 2, size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}

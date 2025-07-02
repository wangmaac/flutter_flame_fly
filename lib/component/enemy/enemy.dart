import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

class Enemy extends SpriteComponent with HasGameReference<MyGame> {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    sprite = Sprite(Flame.images.fromCache('enemy.png'), srcPosition: Vector2(417, 192), srcSize: Vector2(128, 79));
    size = Vector2(sprite!.src.width / 2, sprite!.src.height / 2);
    anchor = Anchor.center;
    position = Vector2(game.size.x / 2, size.y / 2);
  }
}

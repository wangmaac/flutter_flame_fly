import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_flame_fly/games/game_widget.dart';

class Player extends SpriteComponent with HasGameReference<MyGame> {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    final image = Flame.images.fromCache('player_image.png');
    sprite = Sprite(image, srcPosition: Vector2(109, 1), srcSize: Vector2(105, 96));
    size = Vector2(sprite!.src.width / 2, sprite!.src.height / 2);
    anchor = Anchor.center;
    position = Vector2(game.size.x / 2, game.size.y - size.y / 2);
  }
}

//직접 다 그릴자신 있으면, 하지만 우리는 그냥 이미지(스프라이트)로 처리할꺼임.
class Player2 extends Component {}

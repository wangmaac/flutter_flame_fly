import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Player extends SpriteComponent {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    sprite = Sprite(
      Flame.images.fromCache('player_image.png'),
      srcPosition: Vector2(109, 1),
      srcSize: Vector2(105, 96),
    );
  }
}

//직접 다 그릴자신 있으면, 하지만 우리는 그냥 이미지(스프라이트)로 처리할꺼임.
class Player2 extends Component {}

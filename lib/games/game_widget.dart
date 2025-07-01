import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameWidgetPage extends StatelessWidget {
  const GameWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MyGame());
  }
}

class MyGame extends FlameGame {}

import 'dart:math';

import 'package:flame/spritesheet.dart';
import 'package:flutter_galaxy/components/planet.dart';
import '../langaw-game.dart';
import 'earth-planet.dart';

class JupyterPlanet extends Planet {
  JupyterPlanet(LangawGame game, double x) : super(game, x) {
    radius = earthMedianSize*1.5 + Random().nextInt(10);
    spriteRow = 9;
    spriteColumn = 8;
    planetSpritesheet = SpriteSheet(
      imageName: 'jupyter-sprite-sheet.png',
      textureWidth: 200,
      textureHeight: 200,
      columns: 8,
      rows: 9,
    );
  }
}
import 'dart:math';

import 'package:flame/spritesheet.dart';
import 'package:flutter_galaxy/components/planet.dart';
import '../langaw-game.dart';
import 'earth-planet.dart';

class NeptunePlanet extends Planet {
  NeptunePlanet(LangawGame game, double x) : super(game, x) {
    radius = earthMedianSize*1.2 + Random().nextInt(10);
    spriteRow = 20;
    spriteColumn = 5;
    planetSpritesheet = SpriteSheet(
      imageName: 'neptune-sprite-sheet.png',
      textureWidth: 240,
      textureHeight: 209,
      columns: 5,
      rows: 20,
    );
  }
}
import 'dart:math';

import 'package:flame/spritesheet.dart';
import 'package:flutter_galaxy/components/planet.dart';
import '../langaw-game.dart';
import 'earth-planet.dart';

class MarsPlanet extends Planet {
  MarsPlanet(LangawGame game, double x) : super(game, x) {
    radius = earthMedianSize*.8 + Random().nextInt(10);
    spriteRow = 10;
    spriteColumn = 9;
    planetSpritesheet = SpriteSheet(
      imageName: 'mars-sprite-sheet.png',
      textureWidth: 267,
      textureHeight: 200,
      columns: 9,
      rows: 10,
    );
  }
}
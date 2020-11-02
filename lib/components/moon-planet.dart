import 'dart:math';

import 'package:flame/spritesheet.dart';
import 'package:flutter_galaxy/components/planet.dart';
import '../langaw-game.dart';
import 'earth-planet.dart';

class MoonPlanet extends Planet {
  MoonPlanet(LangawGame game, double x) : super(game, x) {
    radius = earthMedianSize*.6 + Random().nextInt(10);
    spriteRow = 12;
    spriteColumn = 5;
    planetSpritesheet = SpriteSheet(
      imageName: 'moon-sprite-sheet.png',
      textureWidth: 75,
      textureHeight: 70,
      columns: 5,
      rows: 12,
    );
  }
}
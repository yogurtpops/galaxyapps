import 'dart:math';

import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter_galaxy/components/planet.dart';

import '../langaw-game.dart';

const earthMedianSize = 30.0;

class EarthPlanet extends Planet {
  EarthPlanet(LangawGame game, double x) : super(game, x) {
    radius = 25.0 + Random().nextInt(10);
    spriteRow = 16;
    spriteColumn = 16;
    planetSpritesheet = SpriteSheet(
      imageName: 'earth_sprite_frames.png',
      textureWidth: 64,
      textureHeight: 64,
      columns: 16,
      rows: 16,
    );
  }
}
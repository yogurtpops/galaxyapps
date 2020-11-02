import 'dart:ui';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';

import '../langaw-game.dart';

class Blackhole {
  final LangawGame game;
  Rect bgRect;
  SpriteSheet spritesheet;
  int bgSpriteIndexX;
  int bgSpriteIndeY;
  int spriteIncrement=1;

  Blackhole(this.game) {
    bgSpriteIndexX=0;
    bgSpriteIndeY=0;

    spritesheet = SpriteSheet(
      imageName: 'fortnite-blackhole-sprite.png',
      textureWidth: 154,
      textureHeight: 154,
      columns: 5,
      rows: 10,
    );

    bgRect = Rect.fromCircle(
      center: Offset(game.screenSize.width/2, game.screenSize.height/2,),
      radius: 100
    );
  }

  void render(Canvas c) {
    try {
      spritesheet.getSprite(bgSpriteIndexX, bgSpriteIndeY).renderRect(c, bgRect);
    } catch(_){

    }
  }

  void update(double t) {
    if (bgSpriteIndexX==0&&bgSpriteIndeY==0){
      spriteIncrement = 1;
      bgSpriteIndexX+=spriteIncrement;
    } else if (bgSpriteIndexX==9&&bgSpriteIndeY==4){
      bgSpriteIndeY=0;
      bgSpriteIndexX=0;
      // spriteIncrement = -1;
      // bgSpriteIndexX+=spriteIncrement;
    } else if ((bgSpriteIndexX==9&&spriteIncrement==1)){
      bgSpriteIndexX=0;
      bgSpriteIndeY+=spriteIncrement;
    // } else if ((bgSpriteIndexX==0&&spriteIncrement==-1)){
    //   bgSpriteIndexX=9;
    //   bgSpriteIndeY+=spriteIncrement;
    } else {
      bgSpriteIndexX+=spriteIncrement;
    }
  }

}
import 'dart:ui';
import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:flame/spritesheet.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../langaw-game.dart';

class Planet extends SpriteComponent {
  final LangawGame game;
  static const SPEED = 1;
  double radius;
  int pointerSpriteIndexX = 0;
  int pointerSpriteIndexY = 0;
  Rect spriteRect;
  SpriteSheet planetSpritesheet;
  SpriteSheet fireSpritesheet;
  int spriteRow;
  int spriteColumn;
  bool exploding=false;
  bool exploded=false;
  int spriteIncrement;
  var paint = Paint();

  Planet(this.game, double size) {
    height = width = size;
    anchor = Anchor.center;
    paint..color = Colors.transparent;
  }

  @override
  void render(Canvas c) {
    prepareCanvas(c);

    c.drawRect(Rect.fromLTWH(0, 0, width, height), paint);

    spriteRect = Rect.fromCircle(
        center: Offset.zero,
        radius: radius
    );

    if (exploding){
      fireSpritesheet.getSprite(pointerSpriteIndexY, pointerSpriteIndexX).renderRect(c, spriteRect);
    } else {
      planetSpritesheet.getSprite(pointerSpriteIndexX, pointerSpriteIndexY).renderRect(c, spriteRect);
    }
  }

  @override
  void update(double t) {
    if (!exploding){
      if (pointerSpriteIndexX==spriteRow-1&&pointerSpriteIndexY==spriteColumn-1){
        pointerSpriteIndexX=0;
        pointerSpriteIndexY=0;
      } else if (pointerSpriteIndexX==spriteRow-1){
        pointerSpriteIndexX=0;
        pointerSpriteIndexY+=1;
      } else {
        pointerSpriteIndexX+=1;
      }

      if(width>=25&&height>=25){
        radius-=.02;
      } else {
        radius-=1.5;
      }

      angle += SPEED * t ;
      angle %= 2 * math.pi;

      if (!(width==0 && height==0) && (spriteRow!=null&&spriteColumn!=null)) {
        width-=.5;
        height-=.5;
      }
    } else {
      if (pointerSpriteIndexY==spriteRow-1&&pointerSpriteIndexX==spriteColumn-1){
        exploded=true;
      } else if (pointerSpriteIndexX==spriteColumn-1){
        pointerSpriteIndexX=0;
        pointerSpriteIndexY+=spriteIncrement;
      } else {
        pointerSpriteIndexX+=spriteIncrement;
      }
    }
  }



  void destroyPlanet(){
    fireSpritesheet = SpriteSheet(
      imageName: 'explosion-sprite.png',
      textureWidth: 400,
      textureHeight: 400,
      columns: 5,
      rows: 5,
    );
    spriteRow=5;
    spriteColumn=5;
    pointerSpriteIndexX=0;
    pointerSpriteIndexY=0;
    spriteIncrement = 1;
    exploding=true;
  }
}
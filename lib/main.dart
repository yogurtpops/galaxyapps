import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'langaw-game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();

  LangawGame game = LangawGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);

  Flame.images.loadAll(<String>[
    'earth_sprite_frames.png',
    'moon-sprite-sheet.png',
    'neptune-sprite-sheet.png',
    'mars-sprite-sheet.png',
    'jupyter-sprite-sheet.png',
    'fortnite-blackhole-sprite.png',
    'explosion-sprite.png']);
}
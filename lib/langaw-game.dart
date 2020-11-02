import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_galaxy/components/earth-planet.dart';
import 'package:flutter_galaxy/components/jupyter-planet.dart';
import 'package:flutter_galaxy/components/mars-planet.dart';
import 'package:flutter_galaxy/components/moon-planet.dart';
import 'package:flutter_galaxy/components/neptune-planet.dart';
import 'components/blackhole.dart';
import 'components/planet.dart';

class LangawGame extends Game {
  Size screenSize;
  List<Planet> planets;
  Random rnd = Random();
  Blackhole background;
  bool tapped = false;

  LangawGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    background = Blackhole(this);

    planets = List<Planet>();
    createEarth();
    createMoon();
    createMars();
    createJupyter();
    createNeptune();
  }

  void render(Canvas canvas) {
    background.render(canvas);
    planets.forEach((Planet planet) {
        canvas.save();
        planet.render(canvas);
        canvas.restore();
    });

    if (!tapped){
      final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 30,
      );
      final textSpan = TextSpan(
        text: 'Tap the Planet!',
        style: textStyle,
      );
      final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center
      );
      textPainter.layout(
        minWidth: screenSize.width,
        maxWidth: screenSize.width,
      );
      final offset = Offset(0,screenSize.height-200);
      textPainter.paint(canvas, offset);
    }
  }

  void recreatePlanet(Planet planet){
    if (planet is EarthPlanet){
      print('recreate earth');
      createEarth();
    } else if (planet is MoonPlanet){
      print('recreate moon');
      createMoon();
    } else if (planet is MarsPlanet){
      createMars();
    } else if (planet is JupyterPlanet){
      createJupyter();
    } else if (planet is NeptunePlanet){
      createNeptune();
    }
  }

  void update(double t) {
    if (planets!=null){
      planets.forEach((Planet planet) {
        if (planet.width<=0 || planet.exploded){
          Planet temp = planet;
          planets.remove(planet);
          recreatePlanet(temp);
        } else {
          planet.update(t);
        }
      });
    }

    background.update(t);
  }

  void resize(Size size) {
    screenSize = size;
  }

  void onTapDown(TapDownDetails d) {
    planets.forEach((Planet planet) {
      double angle = planet.angle;
      double planetXCoordinate = cos(180/pi*angle%90)*(sqrt(1/2*planet.width*planet.width)) + (screenSize.width/2);
      double planetYCoordinate = sin(180/pi*angle%90)*(sqrt(1/2*planet.width*planet.width)) + (screenSize.height/2);

      Rect tapRect = Rect.fromCircle(center:Offset(d.globalPosition.dx, d.globalPosition.dy), radius:planet.radius);
      Rect planetRect = Rect.fromCircle(center:Offset(planetXCoordinate, planetYCoordinate), radius:planet.radius);
      if (planetRect.overlaps(tapRect)&&!planet.exploding){
          tapped = true;
          planet.destroyPlanet();
      }
    });
  }

  void createMars() {
    final s3 = MarsPlanet(this, screenSize.width+rnd.nextInt(20));
    s3.x = (screenSize.width/2).floor()*1.0;
    s3.y = (screenSize.height/2).floor()*1.0;
    planets.add(s3);
  }

  void createEarth() {
    final s3 = EarthPlanet(this, (screenSize.width+20)+rnd.nextInt(40));
    s3.x = (screenSize.width/2).floor()*1.0;
    s3.y = (screenSize.height/2).floor()*1.0;
    planets.add(s3);
  }

  void createMoon() {
    final s3 = MoonPlanet(this, screenSize.width+60+rnd.nextInt(20));
    s3.x = (screenSize.width/2).floor()*1.0;
    s3.y = (screenSize.height/2).floor()*1.0;
    planets.add(s3);
  }

  void createJupyter() {
    final s3 = JupyterPlanet(this, screenSize.width+80+rnd.nextInt(20));
    s3.x = (screenSize.width/2).floor()*1.0;
    s3.y = (screenSize.height/2).floor()*1.0;
    planets.add(s3);
  }

  void createNeptune() {
    final s3 = NeptunePlanet(this, screenSize.width+100+rnd.nextInt(50));
    s3.x = (screenSize.width/2).floor()*1.0;
    s3.y = (screenSize.height/2).floor()*1.0;
    planets.add(s3);
  }
}
import 'dart:ui';
import 'package:clickergame/clicker-game.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flame/time.dart';
import 'package:flutter/material.dart';

class Dig {
  final ClickerGame game;
  Rect digRect;
  Paint digPaint;
  double posX = 0;
  double posY = 0;
  double digSpeed = 0;
  Timer interval;
  int elapsedSecs = 0;

  var copperText;

  Dig(this.game, double x, double y) {
    posX = x;
    posY = y;
    digRect = Rect.fromLTWH(x, y, 150, 150);
    digPaint = Paint()..color = Color(0xFFFFFFFF);
  }

  void render(Canvas c) {
    const TextConfig titleConfig = TextConfig(fontSize: 24.0);
    const TextConfig textConfig = TextConfig(fontSize: 16.0);

    c.drawRect(digRect, digPaint);

    titleConfig.render(c, "Dig Speed:", Position(posX - 150, posY));
    textConfig.render(
        c, game.digProgress.toString(), Position(posX - 150, posY + 30));
  }

  void update(double t) {}

  void onTapDown() {
    game.digProgress += 50;
    checkDigSpeed();
  }

  void checkDigSpeed() {
    var amount = game.digProgress / 100;
    game.copperValue = game.copperValue + (amount * game.copperYield)
        .floorToDouble();

    if (game.digProgress % 100 == 0) {
      game.digProgress = game.digProgress - amount * 100;
    }
  }
}

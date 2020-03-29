import 'dart:ui';

import 'package:clickergame/clicker-game.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flame/time.dart';
import 'package:flutter/material.dart';

class Dig {
  final ClickerGame game;
  Rect digRect;
  double digSpeed = 0;
  Timer interval;
  int elapsedSecs = 0;
  Sprite bgSprite;

  var copperText;

  Dig(this.game) {
    bgSprite = Sprite("shovel.jpg");
  }

  void render(Canvas c) {
    const TextConfig titleConfig = TextConfig(fontSize: 24.0);
    const TextConfig textConfig = TextConfig(fontSize: 16.0);

    var posY = game.screenSize.height / 2 - 160;
    var posX = game.screenSize.width / 2 - 160;
    digRect = Rect.fromLTWH(posX, posY, 150, 150);

    String copperText = "Copper Vein: ${game.copper.copperVein}";
    TextConfig(fontSize: 16.0)
      ..render(c, copperText, Position(game.screenSize.width / 2 - 315, 20));

    titleConfig.render(c, "Dig Speed:", Position(posX - 150, posY));
    textConfig.render(
        c, game.digProgress.toString(), Position(posX - 150, posY + 30));

    bgSprite.renderRect(c, digRect);
  }

  void update(double t) {}

  void onTapDown() {
    game.digProgress += 25;
    checkDigSpeed();
  }

  void checkDigSpeed() {
    var amount = game.digProgress / 100;
    game.copper.setCopperValue(amount.floorToDouble());

    if (game.digProgress % 100 == 0) {
      game.digProgress = game.digProgress - amount * 100;
    }
  }
}

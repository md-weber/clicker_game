import 'dart:ui';

import 'package:clickergame/components/dig.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flame/time.dart';
import 'package:flutter/gestures.dart';

class ClickerGame extends Game with TapDetector {
  Size screenSize;
  bool hasWon = false;
  Dig digButton;
  Timer interval;

  double digProgress = 0;

  // Copper values
  double copperValue = 0;
  double copperYield = 1;

  ClickerGame() {
     initializeBackgroundMusic();
    interval = Timer(1, repeat: true, callback: () {});
    interval.start();
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    String copperText = "Copper Ore: $copperValue";

    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint()..color = Color(0xffdbcfba);
    canvas.drawRect(bgRect, bgPaint);

    digButton =
        Dig(this, screenSize.width / 2 - 160, screenSize.height / 2 - 160)
          ..render(canvas);
    TextConfig(fontSize: 16.0)
      ..render(canvas, copperText, Position(screenSize.width / 2 - 315, 20));
  }

  @override
  void onTapDown(TapDownDetails d) {
    if (digButton.digRect.contains(d.globalPosition)) digButton.onTapDown();
  }

  @override
  void update(double dt) {
    interval.update(dt);
    digButton?.update(dt);
  }

  Future<void> initializeBackgroundMusic() async {
    const String backgroundLocation = "bgm";
    int songNumber = 1;

    Flame.audio.audioCache.loadAll([
      "bgm/song1.mp3",
      "bgm/song2.mp3",
      "bgm/song3.mp3",
      "bgm/song4.mp3",
    ]);

    Flame.audio.loop("$backgroundLocation/song$songNumber.mp3");
  }
}

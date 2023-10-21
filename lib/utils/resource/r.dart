library r;

import 'package:flutter/material.dart';
part './data/colors.dart';
part './data/pngs.dart';
part './data/svgs.dart';
part './data/lotties.dart';
part './data/gifs.dart';

class R {
  R._();

  static final colors = _Colors();
  static final pngs = _Pngs();
  static final svgs = _Svgs();
  static final lotties = _Lotties();
  static final gifs = _Gifs();
}

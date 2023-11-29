import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/widgets.dart';

enum Session {
  morning,
  midday,
  evening;

  String get name {
    if (this == morning) {
      return 'Morning';
    } else if (this == midday) {
      return 'Mid-day';
    } else {
      return 'Evening';
    }
  }

  Color get textColor {
    if (this == morning) {
      return R.colors.black;
    } else {
      return R.colors.white;
    }
  }

  Color get color {
    if (this == morning) {
      return R.colors.white;
    } else if (this == midday) {
      return const Color(0xFF3d7ed0);
    } else {
      return const Color(0xff1a3d7f);
    }
  }
}

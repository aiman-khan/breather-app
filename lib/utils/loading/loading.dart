import 'package:flutter/material.dart';

import '../resource/r.dart';

OverlayEntry? _overlayEntry;

/// [For Loading overlay]
void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => ColoredBox(
      color: R.colors.white.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          color: R.colors.blue669BE7,
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

/// [For Dismissing Loading overlay]
void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}

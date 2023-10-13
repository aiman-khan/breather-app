import 'package:my_breather_app/utils/resource/r.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool _isToastShowing = false;

void showToast(String msg) {
  if (_isToastShowing) {
    /// [ A toast is already showing, so ignore this call]
    return;
  } else {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: R.colors.black.withOpacity(0.7),
      textColor: R.colors.white,
      fontSize: 16.sp,
    );
    _isToastShowing = true;

    /// [ Delay resetting _isToastShowing to false until the toast is done
    /// showing]
    Future.delayed(const Duration(seconds: 2), () {
      _isToastShowing = false;
    });
  }
}

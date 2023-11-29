import 'package:breather_app/utils/export.dart';

class VibrateTile extends StatefulWidget {
  const VibrateTile({
    super.key,
  });

  @override
  State<VibrateTile> createState() => _VibrateTileState();
}

class _VibrateTileState extends State<VibrateTile> {
  bool isVibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Vibrate when alarm sounds',
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              isVibrationEnabled = !isVibrationEnabled;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 37.w,
            height: 18.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFF365FA3),
            ),
            child: Row(
              mainAxisAlignment: isVibrationEnabled
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 555),
                  curve: Curves.easeInOut,
                  width: 8.r,
                  height: 8.r,
                  margin: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 2.h,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

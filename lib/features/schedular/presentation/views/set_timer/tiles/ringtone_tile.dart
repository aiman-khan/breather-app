import 'package:breather_app/utils/export.dart';

class RingToneTileWidget extends StatelessWidget {
  const RingToneTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Ringtone',
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          'Default Ringtone',
          style: TextStyle(
            fontSize: 10.sp,
            color: R.colors.grey4F4F4F,
            fontWeight: FontWeight.w500,
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 18.r,
        )
      ],
    );
  }
}

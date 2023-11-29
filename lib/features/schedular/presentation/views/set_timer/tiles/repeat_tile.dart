import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/repeat_status_provider.dart';
import 'package:breather_app/features/schedular/presentation/views/set_timer/dialogs/repeat_dialog.dart';
import 'package:breather_app/utils/export.dart';

class RepeatTileWidget extends StatelessWidget {
  const RepeatTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Repeat',
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const RepeatDialog();
              },
            );
          },
          child: Consumer(builder: (context, ref, _) {
            final repeatStatus = ref.watch(repeatStatusProvider);

            return Text(
              repeatStatus?.name ?? 'Default',
              style: TextStyle(
                fontSize: 10.sp,
                color: R.colors.grey4F4F4F,
                fontWeight: FontWeight.w500,
              ),
            );
          }),
        ),
        Icon(
          Icons.chevron_right,
          size: 18.r,
        )
      ],
    );
  }
}

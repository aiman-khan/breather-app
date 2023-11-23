import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RingAnimation extends StatefulWidget {
  const RingAnimation({super.key});

  @override
  State<RingAnimation> createState() => _RingAnimationState();
}

class _RingAnimationState extends State<RingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final secondsLeft = (4 - (3 * _animation.value)).toInt();

    return Center(
      child: SizedBox(
        width: 206.r,
        height: 206.r,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(206.r, 206.r), // Fixed size for CustomPaint
              painter: RingPainter(progress: _animation.value),
            ),
            Center(
              child: Text(
                '$secondsLeft',
                style: TextStyle(
                  fontSize: 82.296.sp,
                  fontWeight: FontWeight.w600,
                  color: R.colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RingPainter extends CustomPainter {
  final double progress;

  RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 8) / 2;

    final ringPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9.5;

    canvas.drawCircle(center, radius, ringPaint);

    if (progress > 0) {
      final bluePaint = Paint()
        ..color = const Color(0xFF238CFF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9.5
        ..strokeCap = StrokeCap.round;

      final sweepAngle = 2 * 3.14 * progress;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -3.14 / 2, // -90 degrees (top)
        sweepAngle, // Angle corresponding to progress
        false,
        bluePaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

import 'dart:async';
import 'dart:math';

import 'package:breather_app/features/home/domain/models/breathing_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StateAnimation extends StatefulWidget {
  const StateAnimation({
    super.key,
    required this.pattern,
  });

  final BreathingPattern pattern;

  @override
  State<StateAnimation> createState() => _StateAnimationState();
}

class _StateAnimationState extends State<StateAnimation> {
  int seconds = 1;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > (widget.pattern.cycleDuration)) {
        setState(() {
          isFinished = true;
        });
        timer.cancel;
      } else {
        setState(() {
          seconds++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    return Stack(
      alignment: Alignment.center,
      children: [
        RingAnimation(pattern: widget.pattern),
        EarthOrbitAnimation(pattern: widget.pattern),
        Container(
          height: 115.h,
          width: 115.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            gradient: const LinearGradient(
              colors: [
                Color(0xff204D94),
                Color(0xFf153371),
              ],
            ),
          ),
          child: Text(
            isFinished
                ? 'Finished'
                : '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class RingAnimation extends StatefulWidget {
  final BreathingPattern pattern;

  const RingAnimation({super.key, required this.pattern});

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
    final sec = widget.pattern.holdDuration +
        widget.pattern.inhaleDuration +
        widget.pattern.exhaleDuration;

    _controller = AnimationController(
      duration: Duration(seconds: sec), // Animation duration
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });

    Future.delayed(Duration(seconds: widget.pattern.cycleDuration), () {
      _controller.stop();
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(157.r, 157.r), // Size of the ring
        painter: RingPainter(_animation.value),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;

  RingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFA5A5A5)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sweepAngle = 2 * 3.1415927 * progress;

    canvas.drawCircle(center, radius, paint);
    paint.color = const Color(0xFf163776);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -3.1415927 / 2, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class EarthOrbitAnimation extends StatefulWidget {
  final BreathingPattern pattern;

  const EarthOrbitAnimation({super.key, required this.pattern});

  @override
  State<EarthOrbitAnimation> createState() => _EarthOrbitAnimationState();
}

class _EarthOrbitAnimationState extends State<EarthOrbitAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double earthRadius = 14.r;
  double sunRadius = 50.r;
  double orbitRadius = 80.r;

  @override
  void initState() {
    super.initState();
    final sec = widget.pattern.holdDuration +
        widget.pattern.inhaleDuration +
        widget.pattern.exhaleDuration;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: sec),
    )..repeat();

    // Stop the animation after the specified duration
    Future.delayed(Duration(seconds: widget.pattern.cycleDuration), () {
      _controller.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(40.r, 40.r),
      painter: EarthOrbitPainter(
        animation: _controller,
        earthRadius: earthRadius,
        sunRadius: sunRadius,
        orbitRadius: orbitRadius,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class EarthOrbitPainter extends CustomPainter {
  final Animation<double> animation;
  final double earthRadius;
  final double sunRadius;
  final double orbitRadius;

  EarthOrbitPainter({
    required this.animation,
    required this.earthRadius,
    required this.sunRadius,
    required this.orbitRadius,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final earthPaint = Paint()..color = const Color(0xFF2477FF);

    final center = size.center(Offset.zero);
    // final progress = animation.value;

    final progress = (animation.value + 0.75) % 1.0;

    final earthAngle = 2 * pi * progress;

    final earthX = center.dx + orbitRadius * cos(earthAngle);
    final earthY = center.dy + orbitRadius * sin(earthAngle);

    canvas.drawCircle(Offset(earthX, earthY), earthRadius, earthPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

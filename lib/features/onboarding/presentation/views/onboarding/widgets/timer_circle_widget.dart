import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/domain/usecases/save_user_usecase.dart';
import 'package:breather_app/features/onboarding/presentation/providers/breathing_result_provider.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/widgets/result_widget.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TimerCircleWidget extends ConsumerStatefulWidget {
  const TimerCircleWidget({
    super.key,
  });

  @override
  ConsumerState<TimerCircleWidget> createState() => _TimerCircleWidgetState();
}

class _TimerCircleWidgetState extends ConsumerState<TimerCircleWidget> {
  int _countdown = 3;
  int _minutes = 0;
  int _seconds = 0;
  int _score = 0;
  bool _showCountdown = false;
  String message = 'Breathe from your nose';

  String buttonText = 'Start';
  bool showTimer = false;

  bool hasBegun = false;
  bool isFinished = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    begin();
  }

  void begin() {
    Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  void startCountdown() {
    setState(() {
      _showCountdown = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 3) {
        setState(() {
          _countdown--;
          message = 'Breathe from your nose';
        });
      } else if (_countdown == 2) {
        setState(() {
          _countdown--;
          message = 'Take a deep breathe';
        });
      } else if (_countdown == 1) {
        setState(() {
          _countdown--;
          message = 'Let\'s start!';
        });
      } else {
        _timer.cancel();
        setState(() {
          buttonText = 'End Test';
        });
        startTimer();
      }
    });
  }

  void startTimer() {
    setState(() {
      showTimer = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;

        if (_seconds <= 4) {
          setState(() {
            message = 'Breath in';
          });
        } else if (_seconds >= 5 && _seconds <= 64) {
          setState(() {
            message = 'Hold';
          });
        } else {
          setState(() {
            message = 'Breath out';
          });
        }

        if (_seconds == 67) {
          _seconds = 0;
          _minutes++;
          _timer.cancel();
          isFinished = true;
          buttonText = 'Done';
        }

        ref.read(breathingSecondsProvider.notifier).state = _seconds;

        if (_seconds % 5 == 0) {
          if (_score < 10) {
            _score++;
          }
          ref.read(breathingScoreProvider.notifier).state = _score;
        }
      });
    });
  }

  void endTest() {
    _timer.cancel();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: ResultWidget(
            onTap: () async {
              if (!mounted) return;

              GoRouter.of(context).pushReplacement(RoutePaths.premium);
            },
          ),
        );
      },
    );
  }

  Future<void> _saveUser(UserModel user) async {
    final saveUserUsecase = sl<SaveUserUsecase>();
    final input = SaveUserUsecaseInput(user: user);
    await saveUserUsecase(input);
  }

  double opacity = 0.0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showTimer
            ? const BreathingAnimation(
                totalSeconds: 67,
              )
            : Container(
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
                child: isFinished
                    ? Text(
                        'Finished',
                        style: TextStyle(
                          color: R.colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        _showCountdown
                            ? '00:${_countdown.toString().padLeft(2, '0')}'
                            : 'Lungs\nTest',
                        style: TextStyle(
                          color: R.colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
        85.hb,
        Visibility(
          visible: _showCountdown,
          child: SizedBox(
            height: 27.h,
            child: Text(
              isFinished ? 'Test Completed' : message,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: R.colors.grey4F4F4F,
              ),
              // child: AnimatedTextKit(
              //   repeatForever: true,
              //   animatedTexts: [
              //     FadeAnimatedText(
              //       message,
              //       fadeInEnd: 0.2,
              //       fadeOutBegin: 0.8,
              //       duration: const Duration(milliseconds: 1000),
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
        Visibility(
          visible: !_showCountdown,
          child: SizedBox(
            height: 27.h,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: R.colors.grey4F4F4F,
              ),
              child: AnimatedTextKit(
                pause: const Duration(seconds: 1),
                totalRepeatCount: 1,
                onFinished: () {
                  setState(() {
                    hasBegun = true;
                  });
                },
                animatedTexts: [
                  TyperAnimatedText(
                    'Sit back and relax',
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
              ),
            ),
          ),
        ),
        67.hb,
        if (hasBegun)
          TweenAnimationBuilder(
            duration: const Duration(seconds: 1), // Animation duration
            tween: Tween<double>(begin: 0.0, end: opacity),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child: FilledAppButton(
              height: 47.h,
              width: 150.w,
              text: buttonText,
              onTap: () {
                if (buttonText == 'Start') {
                  setState(() {
                    _showCountdown = true;
                  });
                  startCountdown();
                } else {
                  endTest();
                }
              },
            ),
          ),
      ],
    );
  }
}

class EarthOrbitAnimation extends StatefulWidget {
  final int seconds;

  const EarthOrbitAnimation({super.key, required this.seconds});

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
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.seconds),
    )..repeat();

    // Stop the animation after the specified duration
    Future.delayed(Duration(seconds: widget.seconds), () {
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

class BreathingAnimation extends StatefulWidget {
  const BreathingAnimation({
    super.key,
    required this.totalSeconds,
  });

  final int totalSeconds;

  @override
  State<BreathingAnimation> createState() => _BreathingAnimationState();
}

class _BreathingAnimationState extends State<BreathingAnimation> {
  int seconds = 0;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > widget.totalSeconds) {
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
        RingAnimation(seconds: widget.totalSeconds),
        EarthOrbitAnimation(seconds: widget.totalSeconds),
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
  final int seconds;

  const RingAnimation({super.key, required this.seconds});

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
      duration: Duration(seconds: widget.seconds), // Animation duration
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

    Future.delayed(Duration(seconds: widget.seconds), () {
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

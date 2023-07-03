import 'package:flutter/material.dart';

enum SlideAnim { animIn, animOut }

class ContentAnimation extends StatefulWidget {
  final int? position;
  final int? itemCount;
  final Widget? child;

  const ContentAnimation({
    Key? key,
    required this.position,
    required this.itemCount,
    required this.child,
  }) : super(key: key);

  @override
  State<ContentAnimation> createState() => ContentAnimationState();
}

class ContentAnimationState extends State<ContentAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //we need x and y translation variables to animate items in different direction using our enum
    var xTranslation = 0.0, yTranslation = 0.0;

    // if (widget.slideAnim == SlideAnim.animIn) {
    // we need to declare our animation for fade transition widget
    Animation<double> animation =
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      // curve for the way you want to animate your list item widget. you can use anything from curves
      curve:
          Interval(0.05 * widget.position!, 1.0, curve: Curves.fastOutSlowIn),
    ));

    animationController?.forward();

    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) {
        // this will animate items from right with fade transition
        xTranslation = 400 * (1.0 - animation.value);

        return FadeTransition(
          opacity: animation,
          child: Transform(
            // based on our slide direction and x and y
            //values the widget will animate
            transform: Matrix4.translationValues(
              xTranslation,
              yTranslation,
              0.0,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}

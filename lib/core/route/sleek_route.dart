import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SleekRoute extends PageRouteBuilder {
  final Widget child;
  final Duration? duration;
  final String? name;
  final Object? arguements;
  final Offset? from;

  SleekRoute(
      {required this.child,
      this.duration,
      this.name,
      this.from,
      this.arguements})
      : super(
          pageBuilder: (context, anim1, anim2) => child,
          transitionDuration: duration ?? const Duration(milliseconds: 700),
          settings: RouteSettings(name: name, arguments: arguements),
          transitionsBuilder: (context, anim, anim2, child) {
            final begin = from ?? const Offset(0.4, 0.0);
            const end = Offset(0, 0);
            final curveTween = CurveTween(curve: Curves.ease);
            final tween = Tween(begin: begin, end: end).chain(curveTween);
            final offsetAnimation = anim.drive(tween);

            return AnimatedOpacity(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 30),
              opacity: anim.value,
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            );
          },
        );
}

class BlowRoute extends PageRouteBuilder {
  final Widget child;
  final Duration? duration;
  final String? name;
  final Object? arguements;

  BlowRoute({required this.child, this.duration, this.name, this.arguements})
      : super(
          pageBuilder: (context, anim1, anim2) => child,
          transitionDuration: duration ?? const Duration(milliseconds: 100),
          reverseTransitionDuration:
              duration ?? const Duration(milliseconds: 100),
          settings: RouteSettings(name: name, arguments: arguements),
          transitionsBuilder: (context, anim, anim2, child) {
            final curveTween = CurveTween(curve: Curves.ease);
            final tween = Tween<double>(begin: 0, end: 1).chain(curveTween);
            final scaleAnimation = anim.drive(tween);

            return ScaleTransition(
              scale: scaleAnimation,
              child: child,
            );
          },
        );
}


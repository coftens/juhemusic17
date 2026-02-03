import 'package:flutter/material.dart';

class SearchPageRoute extends PageRouteBuilder {
  final Widget child;

  SearchPageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Curve the animation
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            );

            // Scale from top-right
            // Alignment(1.0, -1.0) represents the exact top-right corner.
            // We can adjust this slightly if the buttom is not exactly in the corner,
            // but (0.9, -0.9) is usually a good approximation for a top-right action button padding.
            return ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              alignment: const Alignment(0.9, -0.95), 
              child: FadeTransition(
                opacity: curvedAnimation,
                child: child,
              ),
            );
          },
        );
}

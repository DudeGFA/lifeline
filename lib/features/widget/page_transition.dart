import 'package:flutter/material.dart';

class SizeTransition1 extends PageRouteBuilder{
  final Widget page;

  SizeTransition1(this.page)
  :super(pageBuilder: 
    (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1800),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, anothetAnimation, child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(sizeFactor: animation, axis: Axis.horizontal,
        axisAlignment: 0,
        child: page,
        ),
      );
    },
  );
}


class SizeTransition2 extends PageRouteBuilder{
  final Widget page;

  SizeTransition2(this.page)
  :super(pageBuilder: 
    (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1800),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, anothetAnimation, child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn
      );
      return Align(
        alignment: Alignment.topCenter,
        child: SizeTransition(sizeFactor: animation, axis: Axis.horizontal,
        axisAlignment: 0,
        child: page,
        ),
      );
    },
  );
}


class SizeTransition3 extends PageRouteBuilder{
  final Widget page;

  SizeTransition3(this.page)
  :super(pageBuilder: 
    (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1100),
    reverseTransitionDuration: const Duration(milliseconds: 230),
    transitionsBuilder: (context, animation, anothetAnimation, child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn
      );
      return Align(
        alignment: Alignment.centerLeft,
        child: SizeTransition(sizeFactor: animation, axis: Axis.horizontal,
        axisAlignment: 0,
        child: page,
        ),
      );
    },
  );
}


class SizeTransition4 extends PageRouteBuilder{
  final Widget page;

  SizeTransition4(this.page)
  :super(pageBuilder: 
    (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1100),
    reverseTransitionDuration: const Duration(milliseconds: 230),
    transitionsBuilder: (context, animation, anothetAnimation, child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn
      );
      return Align(
        alignment: Alignment.centerRight,
        child: SizeTransition(sizeFactor: animation, axis: Axis.horizontal,
        axisAlignment: 0,
        child: page,
        ),
      );
    },
  );
}


class SizeTransition5 extends PageRouteBuilder{
  final Widget page;

  SizeTransition5(this.page)
  :super(pageBuilder: 
    (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1600),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anothetAnimation, child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn
      );
      return SlideTransition(position: Tween(begin: const Offset(1.0,0.0), end: const Offset(0.0,0.0)).animate(animation),
      textDirection: TextDirection.rtl,
      child: page,
      );
    },
  );
}
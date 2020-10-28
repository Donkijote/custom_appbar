import 'package:flutter/material.dart';

class BounceTabBar extends StatefulWidget {
  @override
  _BounceTabBarState createState() => _BounceTabBarState();
}

class _BounceTabBarState extends State<BounceTabBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [],
      ),
      bottomNavigationBar: BounceTabBarAnimation(),
    );
  }
}

const _movement = 75.0;

class BounceTabBarAnimation extends StatefulWidget {
  @override
  _BounceTabBarAnimationState createState() => _BounceTabBarAnimationState();
}

class _BounceTabBarAnimationState extends State<BounceTabBarAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationTabBarIn;
  Animation _animationTabBarOut;
  Animation _animationCircle;
  Animation _animationTabBarUp;
  Animation _animationTabBarDown;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    _animationTabBarIn = CurveTween(
      curve: Interval(
        0.1,
        0.6,
        curve: Curves.decelerate,
      ),
    ).animate(_controller);
    _animationTabBarOut = CurveTween(
      curve: Interval(
        0.6,
        1.0,
        curve: Curves.bounceOut,
      ),
    ).animate(_controller);
    _animationTabBarUp = CurveTween(
      curve: Interval(
        0.3,
        0.5,
        curve: Curves.decelerate,
      ),
    ).animate(_controller);
    _animationTabBarDown = CurveTween(
      curve: Interval(
        0.55,
        1.0,
        curve: Curves.bounceOut,
      ),
    ).animate(_controller);
    _animationCircle = CurveTween(
      curve: Interval(
        0.0,
        0.5,
      ),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double currentWidth = width;
    double currentElevation = 0.0;
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          currentWidth = width -
              (_movement * _animationTabBarIn.value) +
              (_movement * _animationTabBarOut.value);
          currentElevation = -_movement * _animationTabBarUp.value +
              _movement * _animationTabBarDown.value;
          return Center(
            child: Container(
              width: currentWidth,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.forward(from: 0.0);
                    },
                    child: Transform.translate(
                      offset: Offset(0.0, currentElevation),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Mashq3 extends StatefulWidget {
  const Mashq3({super.key});

  @override
  State<Mashq3> createState() => _Mashq3State();
}

class _Mashq3State extends State<Mashq3> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    hotReload();
  }

  void hotReload() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = ColorTween(
      begin: Colors.red,
      end: Colors.black,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          hotReload();
          _controller.forward();
          setState(() {});
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(height: 300, width: 300, color: _animation.value);
          },
        ),
      ),
    );
  }
}

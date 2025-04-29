import 'package:flutter/material.dart';

class MashqBirIkki extends StatefulWidget {
  const MashqBirIkki({super.key});

  @override
  State<MashqBirIkki> createState() => _MashqBirIkkiState();
}

class _MashqBirIkkiState extends State<MashqBirIkki>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Curve sellectCurve = Curves.easeIn;

  @override
  void initState() {
    super.initState();

    animationHotReload();
  }

  void animationHotReload() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: sellectCurve);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: Curves.easeIn, child: Text("easeIn")),
                PopupMenuItem(
                  value: Curves.bounceOut,
                  child: Text("bounceOut"),
                ),
                PopupMenuItem(
                  value: Curves.elasticIn,
                  child: Text("elasticIn"),
                ),
              ];
            },
            onSelected: (value) {
              sellectCurve = value;
              animationHotReload();
              setState(() {});
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 100 + (_animation.value * 200),
            height: 100 + (_animation.value * 200),
            color: Colors.amber,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

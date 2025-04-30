import 'package:flutter/material.dart';

class Mashq4 extends StatefulWidget {
  const Mashq4({Key? key}) : super(key: key);

  @override
  State<Mashq4> createState() => _Mashq4ScreenState();
}

class _Mashq4ScreenState extends State<Mashq4>
    with SingleTickerProviderStateMixin {
  // 2. AnimationController ishlatish
  late AnimationController _controller;

  // 3. Konteyner kattalashtirish uchun Tween yaratish
  late Animation<double> _scaleAnimation;

  // 4. Konteyner aylantirish uchun yana bir Tween yaratish
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // AnimationController initializatsiya
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Scale animation Tween
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Rotation animation Tween
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // 360 degrees in radians
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4-Mashq: Animatsiyalar')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // 5. Transform.scale va Transform.rotate orqali birlashtirilgan animatsiya
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Animatsiya',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat(reverse: true);
          }
        },
        child: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

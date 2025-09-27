import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color _color = Colors.grey;
  double _radius = 20.0;
  double _width = 100.0;
  double _height = 100.0;
  _animationSelector() {
    setState(() {
      _color = Colors.orange;
      _radius = 90.0;
      _width = 400.0;
      _height = 400.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        title: Text(
          'Animated Container Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: GestureDetector(
          onTap: _animationSelector,
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_radius),
            ),
            duration: const Duration(milliseconds: 400),
            child: Image.asset('assets/jerry.png'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: const Icon(Icons.animation),
        onPressed: () {
          setState(() {
            _color = Colors.grey;
            _radius = 20.0;
            _width = 100.0;
            _height = 100.0;
          });
        },
      ),
    );
  }
}

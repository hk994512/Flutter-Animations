import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  int _jerryPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          'Animated Align Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Stack(
        children: [
          AnimatedAlign(
            alignment: getPosition(_jerryPosition),
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
              child: Image.asset('assets/jerry.png'),
            ),
          ),

          AnimatedAlign(
            alignment: getPosition(_jerryPosition + 1),
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
              child: Image.asset('assets/tom.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: const Icon(Icons.animation),
        onPressed: () {
          setState(() {
            _jerryPosition += 1;
          });
        },
      ),
    );
  
  }

  Alignment getPosition(int align) {
    switch (align) {
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.center;
      case 4:
        return Alignment.centerRight;
      case 5:
        return Alignment.bottomLeft;
      case 6:
        return Alignment.bottomCenter;
      case 7:
        return Alignment.centerRight;
      case 8:
        return Alignment.bottomRight;
      default:
        _jerryPosition = 0;
        return Alignment.topLeft;
    }
  }
}

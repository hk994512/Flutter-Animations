import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Flutter Animations Startup',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: AnimationControllerStatus(),
      ),
    );
  }
}

class AnimationControllerStatus extends StatefulWidget {
  const AnimationControllerStatus({super.key});

  @override
  State<AnimationControllerStatus> createState() =>
      _AnimationControllerStatusState();
}

class _AnimationControllerStatusState extends State<AnimationControllerStatus>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 12).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        debugPrint('Animation Status changed $status');
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.amber,
            ),
            onPressed: () {
              _animationController.forward();
            },

            child: Icon(Icons.play_arrow),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              _animationController.reverse();
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Animation Controller Value : ${_animationController.value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),

              child: Text(
                'Animation Value : ${_animation.value.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

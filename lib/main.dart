import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_animation/core/routes/routes.dart';
import 'package:todo_animation/core/routes/routes.name.dart';
import 'package:todo_animation/features/view_task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: !kReleaseMode,
      // onGenerateRoute: Routes.generateRoute,
      // initialRoute: RoutesName.home,
      home: HomeScreen(),
    );
  }
}

class LeftOutDemo extends StatefulWidget {
  @override
  _LeftOutDemoState createState() => _LeftOutDemoState();
}

class _LeftOutDemoState extends State<LeftOutDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-2.0, 0.0), // Slide far to the left
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animateLeftOut() {
    setState(() {
      _isAnimated = true;
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Left Out Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: Container(
                width: 120,
                height: 120,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Box',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _isAnimated ? null : animateLeftOut,
              child: Text('Animate Left Out'),
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeLeftListDemo extends StatefulWidget {
  @override
  _SwipeLeftListDemoState createState() => _SwipeLeftListDemoState();
}

class _SwipeLeftListDemoState extends State<SwipeLeftListDemo> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swipe Left to Remove List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            direction: DismissDirection.endToStart, // Swipe left only
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.blue,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$item removed')),
              );
            },
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}

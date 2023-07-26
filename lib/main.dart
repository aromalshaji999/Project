import 'package:flutter/material.dart';

import 'listviewbuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TestBuilder()


      // ClipRRect(
      //   borderRadius: BorderRadius.circular(20),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Row(
      //         children: [
      //           Image.asset(
      //             'assets/images/test.jpg',
      //             width: 200,
      //             height: 100,
      //             fit: BoxFit.cover,
      //           ),
      //           Image.network(
      //             "https://upload.wikimedia.org/wikipedia/commons/8/8b/Cristiano_Ronaldo_WC2022_-_01_%28cropped%29.jpg",
      //             width: 200,
      //             height: 100,
      //             fit: BoxFit.fill,
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Image.asset(
      //             'assets/images/test.jpg',
      //             width: 200,
      //             height: 100,
      //             fit: BoxFit.cover,
      //           ),
      //           Image.network(
      //             "https://upload.wikimedia.org/wikipedia/commons/8/8b/Cristiano_Ronaldo_WC2022_-_01_%28cropped%29.jpg",
      //             width: 200,
      //             height: 100,
      //             fit: BoxFit.fill,
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Container(
      //             height: 100,
      //             width: 200,
      //             color: Colors.blue,
      //             padding: const EdgeInsets.all(20),
      //             child: const Text(
      //               "Hello",
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold,
      //                   decoration: TextDecoration.none),
      //             ),
      //           ),
      //           Container(
      //             height: 100,
      //             width: 200,
      //             color: Colors.blue,
      //             child: const Padding(
      //               padding: EdgeInsets.only(
      //                 bottom: 20,
      //               ),
      //               child: Test(),
      //             ),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Container(
      //             height: 100,
      //             width: 200,
      //             color: Colors.blue,
      //             child: const Padding(
      //               padding: EdgeInsets.only(
      //                 left: 30,
      //               ),
      //               child: Text(
      //                 "Hello",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold,
      //                     decoration: TextDecoration.none),
      //               ),
      //             ),
      //           ),
      //           Container(
      //             height: 100,
      //             width: 200,
      //             color: Colors.blue,
      //             child: const Padding(
      //               padding: EdgeInsets.only(
      //                 top: 30,
      //               ),
      //               child: Text(
      //                 "Hai",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold,
      //                     decoration: TextDecoration.none),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //            OutlinedButton(
      //                style: OutlinedButton.styleFrom(
      //                  primary: Colors.blue,
      //                  textStyle: const TextStyle(
      //                      color: Colors.red,
      //                      fontSize: 10,
      //                      fontStyle: FontStyle.italic),
      //                ),
      //                onPressed: () {
      //
      //
      //
      //            },
      //            child: const Text("Outline Button")),
      //            TextButton(
      //
      //                style: TextButton.styleFrom(
      //                  primary: Colors.green,
      //                  textStyle: const TextStyle(
      //                      color: Colors.red,
      //                      fontSize: 10,
      //                      fontStyle: FontStyle.normal),
      //                ),
      //                onPressed: () {
      //
      //
      //            },
      //            child: const Text("Text Button")),
      //            FloatingActionButton(
      //
      //                backgroundColor: Colors.blueAccent,
      //
      //                onPressed: () {
      //
      //
      //
      //            },
      //            child: const Icon(Icons.add)),
      //
      //
      //           Expanded(
      //               child: Container(
      //                   color: Colors.yellow,
      //                   height: 50,
      //                   child:  Align(
      //                       alignment: Alignment.bottomRight,
      //                       child: ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           primary: Colors.green,
      //                           textStyle: const TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 10,
      //                               fontStyle: FontStyle.normal),
      //                         ),
      //
      //
      //
      //                         onPressed: () {
      //
      //
      //
      //                       }, child: const Text("Elevated Button"),)
      //           )))
      //         ],
      //       ),
      //
      //
      //
      //     ],
      //   ),
      // ),
    );
  }
}
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin{
  String dropdownvalue = 'Item 1';
  late AnimationController menuAnimation;
  IconData lastIconClicked = Icons.notifications;
  final List <IconData> menuItems = <IconData> [
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];
  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Flow(
        delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
        children: menuItems.map <Widget> ((IconData icon) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: FloatingActionButton(
            backgroundColor: lastIconClicked == icon ? Colors.orangeAccent : Colors.grey,
            splashColor: Colors.orangeAccent,
            onPressed: () {
              if (icon != Icons.menu) {
                setState(() {
                  lastIconClicked = icon;
                });
              }
              menuAnimation.status == AnimationStatus.completed ? menuAnimation.reverse() : menuAnimation.forward();
            },
            child: Icon(icon),
          ),
        )).toList(),
      ),

    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({ required this.menuAnimation}): super(repaint: menuAnimation);

  final Animation <double>  menuAnimation;

  // shouldRepaint override
  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  // paintChildren override
  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx * menuAnimation.value, 0, 0),
      );
    }
  }
}


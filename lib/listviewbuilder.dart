import 'package:flutter/material.dart';

class TestBuilder extends StatefulWidget {
  const TestBuilder({super.key});

  @override
  State<TestBuilder> createState() => _TestBuilderState();
}

class _TestBuilderState extends State<TestBuilder> {
  List<Student>slist=[
    Student(id: 1, name: "aromal", ph: "8887777888"),
    Student(id: 2, name: "sarath", ph: "8887777888"),
    Student(id: 3, name: "sreejith", ph: "8887777888"),
    Student(id: 4, name: "bestin", ph: "8887777888"),
    Student(id: 1, name: "aromal", ph: "8887777888"),
    Student(id: 2, name: "sarath", ph: "8887777888"),
    Student(id: 3, name: "sreejith", ph: "8887777888"),
    Student(id: 4, name: "bestin", ph: "8887777888"),
    Student(id: 1, name: "aromal", ph: "8887777888"),
    Student(id: 2, name: "sarath", ph: "8887777888"),
    Student(id: 3, name: "sreejith", ph: "8887777888"),
    Student(id: 4, name: "bestin", ph: "8887777888")
  ];

  List<String> images = [
    "https://upload.wikimedia.org/wikipedia/commons/8/8b/Cristiano_Ronaldo_WC2022_-_01_%28cropped%29.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/8b/Cristiano_Ronaldo_WC2022_-_01_%28cropped%29.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/8b/Cristiano_Ronaldo_WC2022_-_01_%28cropped%29.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/8b/Cristiano_Ronaldo_WC2022_-_01_%28cropped%29.jpg",

  ];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View Builder"),
      ),
      body:
      Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            GridView.builder(
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index){
                return Image.network(images[index]);
              },
            ),
          ],

        ),
    ));

  }
}

class Student{
  late int id;
  late String name;
  late String ph;

  Student({required this.id, required this.name, required this.ph});
}
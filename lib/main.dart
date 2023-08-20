import 'package:blog_flutter_php/components/TopPostCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  var currentDate = DateFormat('d MMM y').format(DateTime.now());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            width: 150,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Blog Today",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    currentDate,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                  )),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.today) )

            ],
          ),
          TopPostCard(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planner_app_1/day.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomePage',
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        primarySwatch: Colors.indigo,textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int index = 0;
   void onTap(int i) {
    setState(() {
      index = i;
    });

  }
  

  @override
  Widget build(BuildContext context) {
    
    final List<Widget> days = [];
    for(int i = 0; i<7;i++){
      days.add(Day(key:Key(i.toString()),title:i.toString()));
    }

    return Scaffold(
      appBar: AppBar( title: const Text("Weekly Planner"), centerTitle: true, 
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), toolbarHeight: 35,),
      body: Stack(       
        children: [
          Offstage(offstage: index != 0, child: days[0],),
          Offstage(offstage: index != 1, child: days[1],),
          Offstage(offstage: index != 2, child: days[2],),
          Offstage(offstage: index != 3, child: days[3],),
          Offstage(offstage: index != 4, child: days[4],),
          Offstage(offstage: index != 5, child: days[5],),
          Offstage(offstage: index != 6, child: days[6],),
        ],
       
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Sun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Mon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Tues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Wed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Thurs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Fri',
          ),
         BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Sat',
          ),
        ],
         currentIndex: index,
         selectedItemColor: Colors.cyan[800], unselectedItemColor: const Color.fromARGB(255, 63, 68, 81),
         onTap: onTap, 
        ),);
  
  } 
}



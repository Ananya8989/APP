import 'package:flutter/material.dart';
import 'package:planner_app_1/sun.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Column( mainAxisSize: MainAxisSize.max,
     children: <Widget>[ SizedBox(height:75, width: 400, child:const MyHomePage(title: "",)),
     Expanded(
        child: const Days())
        
     ],
    ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Weekly Planner $_counter"), centerTitle: true, backgroundColor: Colors.cyan, toolbarHeight: 35,
      
    ), 
    );
  
    
  }
  
}
class Days extends StatefulWidget{
   const Days({ super.key });

  @override
  State<Days> createState() => _Days();

  
}
class _Days extends State<Days> {
  @override
 Widget build (BuildContext context){
    final daysOfWeek = {'Sun': () {Navigator.push(context,
                           MaterialPageRoute(
                              builder: (context) => sun()));}, 'Mon': () {},'Tue': () {},'Wed': () {},'Thu': () {},'Fri': () {},'Sat': () {}};

    List<Widget> dayWidgets = [];

    for (final key in daysOfWeek.keys) {
      dayWidgets.add(Expanded(
     
      child:ElevatedButton( 
                onPressed: daysOfWeek[key],
                style: TextButton.styleFrom(backgroundColor: Colors.cyan[400]),
                child: Text(key, style: TextStyle(color: Colors.black, fontSize: 12),)) ,
      ));
    }

    return Row( mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start,
    children:dayWidgets,);
    
  }
}



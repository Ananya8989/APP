import 'package:flutter/material.dart';
import 'package:planner_app_1/database.dart';
import 'package:planner_app_1/task.dart';
import 'dart:developer' as developer;


void main() {
 runApp( const Day(title:"A",));
}

class Day extends StatelessWidget {
  final String title;
  const Day({required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.cyan,scaffoldBackgroundColor:const Color.fromARGB(255, 0, 0, 0),
        textTheme: const TextTheme(titleMedium:TextStyle(color: Colors.white))
      ),
      home: DayToDo(title));
  }
}

class DayToDo extends StatefulWidget{
  String s = "";
  DayToDo(String t){
   s= t;
  }
  @override
 _DayToDoState createState() {
  return new _DayToDoState(s);
 }
}

class _DayToDoState extends State<DayToDo>{
   String da = "";
   _DayToDoState(String d){
   da = d;
   developer.log(da);
  }
  late DatabaseHelper dbh;

  List <Task> listOfToDos = [];
 
  TextEditingController cont1 = TextEditingController();
  @override
  void initState(){
    super.initState();
    dbh = DatabaseHelper();
    dbh.initDB().whenComplete(() async {
      setState(() {});
    });
    
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
     body:Column(
      children:<Widget>[Padding(padding: const EdgeInsets.only(top: 16.0),child:
        Container( decoration: BoxDecoration(border: Border.all(color:Colors.cyan)),
         child:TextField( controller: cont1,  
            decoration: const InputDecoration( labelText: "To-Do",iconColor: Color.fromARGB(255, 2, 17, 91),
            prefixIcon: Icon(Icons.add_task),),
      ),)),
        Container( alignment: Alignment.topRight,
         child:IconButton(onPressed: add, 
           icon:const Icon(Icons.add_box_outlined),iconSize: 23,
           color: const Color.fromARGB(255, 6, 214, 218),),
     ),  
     Expanded(child:task()),
       ]));
  }

 Widget task(){
  return RefreshIndicator(onRefresh: _refresh,child: FutureBuilder(future:dbh.getTask() , builder:(BuildContext context, AsyncSnapshot<List<Task>> snapshot){
    if(snapshot.hasData){
    return  ListView.builder(
      itemCount: snapshot.data?.length,itemBuilder: (context, i) {
       if(snapshot.data![i].day == da){
         developer.log("enter Task");
         return ListTile(iconColor: Colors.white,
         title: Text(snapshot.data![i].name), trailing: IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    onPressed: () => dbh.deleteTask(snapshot.data![i].name),
                  ),);}
       else{
          return const Text("");
          }}
                 

    );
    }
    else {
      return const Center(child: CircularProgressIndicator());
   }
 }),
  );}

  Future<void> _refresh(){
   dbh.initDB().whenComplete(() async {
      setState(() {});
    });
  return Future.delayed(const Duration(seconds:1));
 }

  void add() {
    developer.log("entered add");
    if (cont1.text.isNotEmpty) {
      String s = cont1.text;
      setState(() {
        listOfToDos.add(Task(name:s,done:0, day:da));
        cont1.clear();
      });
      addTask(Task(name:s,done:0, day:da));
      developer.log("added");
    }
  }

  Future<int> addTask(Task t) async {
    return await dbh.setTask(t);
  }

  void remove(int i) {
    
    
    setState(() {
      listOfToDos.elementAt(i).setDone(1);
      listOfToDos.removeAt(i);
    });
    initState();
  }

}

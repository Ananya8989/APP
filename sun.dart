import 'package:flutter/material.dart';
void main() {
  runApp(sun());
}
class sun extends StatelessWidget {
  const sun({super.key});
  // Builds a material app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunday To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SunToDo());
  }
}
//creates a stateful widget
class SunToDo extends StatefulWidget{
  @override
_SunToDoState createState() => _SunToDoState();
}
class _SunToDoState extends State<SunToDo>{
  //creates a list of to-dos
  List listOfToDos = [];
 
  TextEditingController refController = new TextEditingController();
  //creates a widget that will house To-dos
  @override
  Widget build(BuildContext context){
     return Scaffold(appBar:AppBar(title:Text("Sunday To-Do List")), body:Column(
      children:<Widget>[
        Expanded(child:
        Row( children: [ IconButton(onPressed: add, icon:const Icon(Icons.add_box_outlined))],
           
        ))]));
  }
  //adds to-dos
   void add() {
    if (refController.text.isNotEmpty) {
      setState(() {
        listOfToDos.add(refController.text);
        refController.clear();
      });
    }
  }

 //removes to-dos at index i
  void remove(int i) {
    setState(() {
      listOfToDos.removeAt(i);
    });
  }


}

import 'package:flutter/material.dart';
import 'dart:async';


import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class Task {
 
  String name;
  int done;
  String day;
  Task({required this.name, required this.done,required this.day});


  getName(){
    return name;
  }
  setDone(int b){
    done = b;
  }
  Task.fromMap(Map<String, dynamic> res)
      : name = res["name"],
        done = res["done"],
        day  = res["day"];
 

  Map<String, Object?> toMap() {
    return {'name': name, 'done': done, 'day': day};
  }


}
